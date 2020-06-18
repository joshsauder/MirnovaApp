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
                NavigationLink(destination: CourseMaterialView(name: data.name)){
                    CourseCell(data: data)
                }
            }
            .navigationBarTitle(Text("Courses"))
            .cornerRadius(10)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)).background(Color.green)
        }
    }
}

struct CourseCell: View {
    var data: CourseData
    
    var body: some View {
        HStack{
            Text(data.name).font(.system(size: 20))
            Spacer()
            
            VStack(alignment: .trailing){
                Text("\(data.questions) questions")
                    .font(.system(size: 15))
                Spacer()
                Text("\(data.correct)/\(data.questions)")
                .font(.system(size: 15))
            }
        }
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
        CourseCell(data: CourseData(id: UUID(), name: "test", correct: 1, questions: 1, completed: true, attempts: 1))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
