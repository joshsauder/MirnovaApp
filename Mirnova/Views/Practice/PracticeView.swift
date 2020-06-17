//
//  PracticeView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
    @State var i: Int = 0
    @ObservedObject var practiceModel: PracticeViewModel
    
    let model: [CourseMaterial]
    
    init(model: [CourseMaterial]){
        self.model = model
        practiceModel = PracticeViewModel(question: model[0].question, answer: model[0].answer, imageString: model[0].image[0])
    }
    
    var body: some View {
         ZStack{
            VStack(alignment: .center) {
                Text(practiceModel.question)
                .frame(minHeight: 0, maxHeight: .infinity)
                Divider()

                Text(practiceModel.answer)
                .frame(minHeight: 0, maxHeight: .infinity)
            }
            .zIndex(1)
            DualButton(destinationFirst: nil, destinationSecond: nil, funcFirst: prevQuestion, funcSecond: nextQuestion, titleFirst: "Previous", titleSecond: "Next")
            
        }.navigationBarTitle("Practice")
    }
    
    func prevQuestion(){
        i -= 1;
        if(i < 0) {i = model.count - 1}
        
        let question = model[i].question
        let answer = model[i].answer
        let image = model[i].image[0]
        practiceModel.updateModel(question: question, answer: answer, imageString: image)
    }
    
    func nextQuestion(){
        i += 1;
        if(i > model.count - 1){ i = 0; }
        
        let question = model[i].question
        let answer = model[i].answer
        let image = model[i].image[0]
        practiceModel.updateModel(question: question, answer: answer, imageString: image)
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = [CourseMaterial(id: UUID(), image: ["test"], question: "test", answer: "test")]
        return PracticeView(model: model)
    }
}
