//
//  CourseMaterial.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation

struct CourseMaterial: Identifiable {
    var id: Int
    var name: String
    var questions: [Questions]
}


struct Questions {
    var question: String
    var answer: String
    var points: Int
    var images: [String]
}
