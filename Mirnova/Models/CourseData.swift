//
//  CourseData.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/14/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit

struct CourseData: Identifiable {
    var id = UUID()
    var name: String
    
    var correct: Int
    var image: UIImage
    var questions: Int
    var completed: Bool
    var attempts: Int
    var average: Double
}
