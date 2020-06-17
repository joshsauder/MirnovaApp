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
    var question: String
    var answer: String
    var image: UIImage = UIImage()
    
    init(question: String, answer: String, imageString: String){
        self.question = question
        self.answer = answer
        self.fetchImage(image: "alphabet/A.jpg")
    }
    
    private func fetchImage(image: String){
        RestRequests().getImage(image: image){ fetchedImage in
            self.image = fetchedImage ?? UIImage()
        }
    }
    
    func updateModel(question: String, answer: String, imageString: String){
        self.question = question
        self.answer = answer
        self.fetchImage(image: "alphabet/B.jpg")
    }
}
