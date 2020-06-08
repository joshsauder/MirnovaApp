//
//  PracticeView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
    @State var question: String
    @State var answer: String
    @State var i: Int = 0
    
    let model: [CourseMaterial]
    
    init(model: [CourseMaterial]){
        self.model = model
        _answer = State(initialValue: model[0].question)
        _question = State(initialValue: model[0].answer)
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
            DualButton(destinationFirst: AnyView(CourseView()), destinationSecond: nil, funcSecond: nextQuestion, titleFirst: "Test", titleSecond: "Next")
            
        }.navigationBarTitle("Practice")
    }
    
    func nextQuestion(){
        i += 1;
        if(i < model.count){
            question = model[i].question
            answer = model[i].answer
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = [CourseMaterial(id: UUID(), image: ["test"], question: "test", answer: "test")]
        return PracticeView(model: model)
    }
}
