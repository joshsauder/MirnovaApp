//
//  CourseView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/13/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct CourseView: View {
    @ObservedObject var model: CourseViewModel
    
    init(user: String){
        self.model = CourseViewModel(user: user)
        IAPManager.shared.getProducts { (result) in
            print(result)
        }
    }
    
    var body: some View {
        NavigationView {
            List(model.courses) { data in
                ZStack{
                    CourseCell(data: data)
                    NavigationLink(destination: CourseMaterialView(courseData: data)){
                        EmptyView()
                    }
                }
            }
            .navigationBarTitle(Text("Courses"))
            .cornerRadius(radius: 10, corners: [.topLeft, .topRight])
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
            .background(Colors.DARK_GREEN)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(true)
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
            Image(uiImage: data.image)
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading){
                Text("\(data.name)")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 2)
                Spacer()
                HStack {
                    GeometryReader { geometry in
                        //need two ZStacks to center text
                        ZStack {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(self.determineColors(data: self.data))
                                    .opacity(0.5)
                                    .cornerRadius(radius: 5, corners: .allCorners)
                                Rectangle()
                                    .foregroundColor(self.determineColors(data: self.data))
                                    .frame(minWidth: 0, idealWidth: self.getProgressBarWidth(geometry: geometry, completed: self.data.correct, total: self.data.questions),
                                           maxWidth: self.getProgressBarWidth(geometry: geometry, completed: self.data.correct, total: self.data.questions))
                                    .cornerRadius(radius: 5, corners: .topLeft)
                            }
                            Text("\(self.data.correct)/\(self.data.questions)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
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
    
    /**
     Determines the color of the progress bar
     - parameters:
        - data: The courses data
     - returns: The color of the progress bar
     */
    func determineColors(data: CourseData) -> Color {
        if data.attempts == 0 { return Color(Colors.GRAY)
        } else if(data.completed){
            return Colors.DARK_GREEN
        } else {
            return Color(Colors.RED)
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(user: "test")
    }
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View{
        Group {
            CourseCell(data: CourseData(id: UUID(), name: "test", correct: 0, image: UIImage(named: "Alphabet")!, questions: 3, completed: false, attempts: 0, average: Double(0)))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
