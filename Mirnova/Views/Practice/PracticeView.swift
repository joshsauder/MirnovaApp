//
//  PracticeView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
    @State var show: Bool = false
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
                Image(uiImage: practiceModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Divider()
                VStack(alignment: .center, spacing: 30){
                    Text("Tap To Show The Answer")
                    .font(Font.system(size: 30))
                    
                    if show {
                        Text(practiceModel.answer)
                            .font(Font.system(size: 30))
                    }else {
                        Text("")
                    }
                    Spacer()
                }.frame(minHeight: 0, maxHeight: .infinity)
                .onTapGesture {
                    self.show = true
                }
            }
            .zIndex(1)
            DualButton(destinationFirst: nil, destinationSecond: nil, funcFirst: prevQuestion, funcSecond: nextQuestion, titleFirst: "Previous", titleSecond: "Next")
            
        }
         .navigationBarTitle("Practice")
    }
    
    func prevQuestion(){
        i -= 1;
        if(i < 0) {i = model.count - 1}
        
        let question = model[i].question
        let answer = model[i].answer
        let image = model[i].image[0]
        show = false
        practiceModel.updateModel(question: question, answer: answer, imageString: image)
    }
    
    func nextQuestion(){
        i += 1;
        if(i > model.count - 1){ i = 0; }
        
        let question = model[i].question
        let answer = model[i].answer
        let image = model[i].image[0]
        show = false
        practiceModel.updateModel(question: question, answer: answer, imageString: image)
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = [CourseMaterial(id: UUID(), image: ["test"], question: "test", answer: "test")]
        return PracticeView(model: model)
    }
}
