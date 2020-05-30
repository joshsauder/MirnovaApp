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
    @State var courseName = ""
    @State var showCourseMaterial = false
    
    func setCourseName(name: String){
        courseName = name
        showCourseMaterial = true
    }
    
    var body: some View {
        VStack {
            HStack{
                Text("Courses").font(.system(size: 24))
                Spacer()
            }
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))

            List(model.courses) { data in
                CourseCell(data: data, onTap: self.setCourseName(name:))
            }
            .cornerRadius(10)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)).background(Color.green)
        }.sheet(isPresented: self.$showCourseMaterial){
            CourseMaterialView(name: self.courseName)
        }
    }
}

struct CourseCell: View {
    var data: CourseData
    var onTap: (String) -> ()
    
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
        }.gesture(TapGesture()
            .onEnded({_ in
                self.onTap(self.data.name);
            }))
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
