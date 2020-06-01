//
//  CourseMaterialViewModel.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI
import Combine
import Apollo

class CourseMaterialViewModel: ObservableObject {

    var name: String
    var courseMaterial: [CourseMaterial] = []
    
    init(name: String) {
        self.name = name
        fetchData()
    }
    
    
    private func fetchData(){
        Network.shared.apollo.fetch(query: CourseQuery(name: name)){ result in
            
            switch result {
            case .failure(let error):
                    print(error)
            case .success(let result):
                let data = result.data!
                self.courseMaterial = data.course?.questions.map({ self.buildCourseMaterial(question: $0!)}) ?? []
            }
            
        }
        
    }
    
    private func buildCourseMaterial(question: CourseQuery.Data.Course.Question) -> CourseMaterial {
        return CourseMaterial(id: UUID(),
                              image: question.images ?? [],
                              question: question.question,
                              answer: question.answer)
    }
    
    func handleClick() {
        print("test")
    }
}
