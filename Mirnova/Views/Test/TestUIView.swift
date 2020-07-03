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
    
    init(courseMaterial: [CourseMaterial]) {
        self.courseMaterial = courseMaterial
    }
    
    var body: some View {
        TestViewControllerRepresentation(courseMaterial: courseMaterial)
    }
}

struct TestUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestUIView(courseMaterial: [CourseMaterial(id: UUID(), imageString: "", image: UIImage(), question: "", answer: "")])
    }
}
