//
//  CourseMaterial.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit

struct CourseMaterial: Identifiable {
    
    var id: UUID
    
    var image: String
    var question: String
    var answer: String
}
