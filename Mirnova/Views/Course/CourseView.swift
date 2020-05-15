//
//  CourseView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/13/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct CourseView: View {
    
    @State var model = CourseViewModel()
    
    var body: some View {
        VStack {
            HStack{
                Text("Courses").font(.system(size: 24))
                Spacer()
                }.padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))

            List(model.courses) { data in
                CourseCell(data: data)
            }
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
