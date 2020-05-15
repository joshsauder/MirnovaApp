//
//  CouseViewModel.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/14/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI
import Combine

class CourseViewModel: ObservableObject {
    let didChange = PassthroughSubject<CourseViewModel, Never>()
    
    
    init() {
        fetchData()
    }
    
    var courses: [CourseData] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchData(){
        courses = [CourseData(id: UUID(uuidString: UUID().uuidString)!, name: "test", correct: 1, questions: 2, completed: true, attempts: 2),
        CourseData(id: UUID(uuidString: UUID().uuidString)!, name: "test2", correct: 3, questions: 5, completed: true, attempts: 1)
        ]
    }
}
