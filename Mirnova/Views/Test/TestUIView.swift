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
    var course: String
    @State var correct: Int = 0
    @State var completed: Int = 0
    @State var total: Int
    
    init(courseMaterial: [CourseMaterial], course: String) {
        self.courseMaterial = courseMaterial
        self.course = course
        _total = State(initialValue: courseMaterial.count)
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Progress")
                    Text("Grade")
                }
                VStack(alignment: .leading) {
                    ProgressBar(completed: $completed, total: $total)
                    ProgressBar(completed: $correct, total: $total)
                }
            }
            .frame(height: 35)
            .padding(.horizontal, 20)
            .padding(.top, 45)
            .padding(.bottom, 5)
            //add one to questions attempted since questions attempted is one behind current question count
            TestViewControllerRepresentation(courseMaterial: courseMaterial, course: course, correct: $correct, completed: $completed)
        }
    }
}

struct TestUIView_Previews: PreviewProvider {
    @State static var questionNumber: Int = 0
    
    static var previews: some View {
        TestUIView(courseMaterial: [CourseMaterial(id: UUID(), imageString: "", image: UIImage(), question: "", answer: "")], course: "test")
    }
}
