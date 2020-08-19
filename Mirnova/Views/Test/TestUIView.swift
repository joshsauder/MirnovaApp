//
//  TestUIView.swift
//  Mirnova
//
//  Created by Josh Sauder on 6/28/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct TestUIView: View {
    var courseMaterial: [CourseMaterial]
    @State var questionsAttempted: Int = 1
    
    
    
    var body: some View {
        VStack {
            ProgressBar(value: CGFloat(questionsAttempted / courseMaterial.count))
                .frame(height: 60)
            //add one to questions attempted since questions attempted is one behind current question count
            TestViewControllerRepresentation(courseMaterial: courseMaterial, questionsAttempted: $questionsAttempted)
        }
    }
}

struct TestUIView_Previews: PreviewProvider {
    @State static var questionNumber: Int = 0
    
    static var previews: some View {
        TestUIView(courseMaterial: [CourseMaterial(id: UUID(), imageString: "", image: UIImage(), question: "", answer: "")])
    }
}
