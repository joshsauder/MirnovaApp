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
    @State var total: Int
    @State var change: Bool = true
    @ObservedObject var practiceModel: PracticeViewModel
    @ObservedObject var imageModel: SignImageViewModel
    
    let model: [CourseMaterial]

    
    init(model: [CourseMaterial]){
        self.model = model
        practiceModel = PracticeViewModel(question: model[0].question, answer: model[0].answer, image: model[0].image)
        imageModel = SignImageViewModel(image: model[0].image)
        _total = State(initialValue: model.count)
    }
    
    var body: some View {
         ZStack{
            VStack(alignment: .center) {
                ProgressBarContainer {
                    HStack {
                        Text("Progress")
                            .foregroundColor(.white)
                        ProgressBar(completed: $i, total: $total)
                    }
                    .padding(.horizontal, 10)
                }
                .cornerRadius(8)
                .frame(height: 60)
                .padding(.horizontal, 10)
                .padding(.top, 10)
                .padding(.bottom, 20)
                if change {
                    SignImageView(imageModel: imageModel)
                        .transition(AnyTransition.slide)
                        .animation(.default)
                }else {
                    SignImageView(imageModel: imageModel)
                        .hidden()
                }
                VStack(alignment: .center, spacing: 30){
                    Text("Tap To Show The Answer")
                    if show {
                        Text(practiceModel.answer)
                    }else {
                        Text("?")
                    }
                    Spacer()
                }
                .frame(minHeight: 0, maxHeight: .infinity)
                .padding(.top, 10)
                .font(Font.system(size: 30))
                .contentShape(Rectangle())
                .onTapGesture {
                    self.show = true
                }
            
            }
            .zIndex(1)
            DualButton(destinationFirst: nil, destinationSecond: nil, funcFirst: prevQuestion, funcSecond: nextQuestion, titleFirst: "Previous", titleSecond: "Next")
            
        }
    }
    
    func prevQuestion(){
        self.change.toggle()
        i -= 1;
        if(i < 0) {i = model.count - 1}
        
        let question = model[i].question
        let answer = model[i].answer
        let image = model[i].image
        show = false
        practiceModel.updateModel(question: question, answer: answer, image: image)
        imageModel.updateImage(image: image)
        self.change.toggle()
    }
    
    func nextQuestion(){
        self.change.toggle()
        i += 1;
        if(i > model.count - 1){ i = 0; }
        
        let question = model[i].question
        let answer = model[i].answer
        let image = model[i].image
        show = false
        practiceModel.updateModel(question: question, answer: answer, image: image)
        imageModel.updateImage(image: image)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.change.toggle()
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = [CourseMaterial(id: UUID(), imageString: "test", image: UIImage(named: "A.jpg")!, question: "test", answer: "test")]
        return PracticeView(model: model)
    }
}
