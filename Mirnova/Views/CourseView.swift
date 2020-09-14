//
//  CourseView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/13/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct CourseView: View {
    @ObservedObject var model = CourseViewModel(user: "test")
    
    var body: some View {
        NavigationView {
            List(model.courses) { data in
                NavigationLink(destination: CourseMaterialView(courseData: data)){
                    CourseCell(data: data)
                }
            }
            .navigationBarTitle(Text("Courses"))
            .cornerRadius(radius: 10, corners: [.topLeft, .topRight])
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
            .background(Colors.DARK_GREEN)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct CourseCell: View {
    var data: CourseData
    var color: Color
    
    init(data: CourseData) {
        self.data = data
        self.color = data.completed ? Color.green : Color.red
    }
    
    var body: some View {
        HStack{
            Image(uiImage: UIImage(named: "Alphabet")!)
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.horizontal, 10)
            
            VStack(alignment: .leading){
                Text("\(data.name)")
                    .font(.system(size: 25, weight: .bold))
                Spacer()
                HStack {
                    GeometryReader { geometry in
                        //need two ZStacks to center text
                        ZStack {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(Colors.LIGHT_GREEN)
                                Rectangle()
                                    .foregroundColor(Colors.DARK_GREEN)
                                    .frame(minWidth: 0, idealWidth: self.getProgressBarWidth(geometry: geometry, completed: self.data.correct, total: self.data.questions),
                                           maxWidth: self.getProgressBarWidth(geometry: geometry, completed: self.data.correct, total: self.data.questions))
                            }
                            Text("\(self.data.correct)/\(self.data.questions)")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                    }
                        
                }
            }
        }
    }
    
    /**
     Updates the progress bars width. Note, completed is needed in order for the progess bar to be updated each time a new question is completed.
     - parameters:
        - geometry: The shapes size and coordinate space
        - completed: Number of questions completed
        - total: Total numbert of questions
     - returns: The with of the progress bar
     */
    func getProgressBarWidth(geometry:GeometryProxy, completed: Int, total: Int) -> CGFloat {
        let frame = geometry.frame(in: .global)
        return frame.size.width * (CGFloat(completed) / CGFloat(total))
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View{
        Group {
        CourseCell(data: CourseData(id: UUID(), name: "test", correct: 1, questions: 3, completed: true, attempts: 1, average: Double(0)))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
