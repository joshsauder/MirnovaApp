//
//  PracticeView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
    let question: String
    let answer: String
    
    init(question: String, answer: String){
        self.answer = answer
        self.question = question
    }
    
    var body: some View {
         ZStack{
            VStack(alignment: .center) {
                Text(question)
                .frame(minHeight: 0, maxHeight: .infinity)
                Divider()

                Text(answer)
                .frame(minHeight: 0, maxHeight: .infinity)
            }
            .zIndex(1)
            DualButton(destinationFirst: AnyView(CourseView()), destinationSecond: AnyView(CourseMaterialView(name: "test")), titleFirst: "Test", titleSecond: "Next")
            
        }.navigationBarTitle("Practice")
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView(question: "test", answer: "test")
    }
}
