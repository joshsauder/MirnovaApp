//
//  CourseMaterialViewModel.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI
import Combine

class CourseMaterialViewModel: ObservableObject {
    
    let didChange = PassthroughSubject<CourseMaterialViewModel, Never>()
    
    init() {
        fetchData()
    }
    
    var courseMaterial: [CourseMaterial] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchData(){
        courseMaterial = [
            CourseMaterial(id: 0, image: "test", answer: "answer"),
            CourseMaterial(id: 1, image: "test2", answer: "answer2")
        ]
    }
    
    func handleClick() {
        print("test")
    }
}
