//
//  TestData.swift
//  Mirnova
//
//  Created by Josh Sauder on 8/21/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI
import Combine

class TestData: ObservableObject, Identifiable {
    @Published var correct: Int
    @Published var completed: Int
    @Published var total: Int
    
    init() {
        self.correct = 0
        self.completed = 0
        self.total = 0
    }
    
    func incrementCorrect(){
        self.correct += 1
    }
    
    func incrementCompleted(){
        self.completed += 1
    }
}
