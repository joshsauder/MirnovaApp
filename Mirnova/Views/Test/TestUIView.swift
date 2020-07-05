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
    @Binding var questionNumber: Int
    
    
    var body: some View {
        TestViewControllerRepresentation(courseMaterial: courseMaterial)
        .navigationBarTitle("Test", displayMode: .inline)
    }
}

struct TestUIView_Previews: PreviewProvider {
    @State static var questionNumber: Int = 0
    
    static var previews: some View {
    TestUIView(courseMaterial: [CourseMaterial(id: UUID(), imageString: "", image: UIImage(), question: "", answer: "")], questionNumber: $questionNumber)
    }
}
