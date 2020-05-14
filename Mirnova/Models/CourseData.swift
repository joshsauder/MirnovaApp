//
//  CourseData.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/14/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation

struct CourseData: Identifiable {
    var id = UUID()
    var name: String
    
    var correct: Int
    var questions: Int
    var completed: Bool
    var attempts: Int
}
