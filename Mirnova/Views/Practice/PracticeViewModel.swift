//
//  PracticeViewModel.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI
import Combine

class PracticeViewModel: ObservableObject {
    @Published var question: String
    @Published var answer: String
    @Published var image: UIImage = UIImage()
    
    init(question: String, answer: String, image: UIImage){
        self.question = question
        self.answer = answer
        self.image = image
    }

    
    func updateModel(question: String, answer: String, image: UIImage){
        self.question = question
        self.answer = answer
        self.image = image
    }
}
