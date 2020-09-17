//
//  ResultsUIView.swift
//  Mirnova
//
//  Created by Josh Sauder on 7/6/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct ResultsUIView: View {
    var userAnswers: [[String: String]] = []
    var courseMaterial: [CourseMaterial] = []
    var totalCorrect: Int = 0
    var passed: Bool = false
    var attempts: Int = 0
    var average: Double = 0
    var callback: (() -> Void)
    
    var body: some View {
        ResultViewRepresentation(userAnswers: userAnswers, courseMaterial: courseMaterial, totalCorrect: totalCorrect, passed: passed, attempts: attempts, average: average, callback: callback)
    }
}

struct ResultsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsUIView(callback: {
            print("test")
        })
    }
}
