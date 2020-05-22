//
//  CouseViewModel.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/14/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI
import Combine
import Apollo

class CourseViewModel: ObservableObject {
    
    @Published var courses: [CourseData] = []
    let user: String
    
    init(user: String) {
        self.user = user
        fetchData()
    }
    
    private func fetchData(){

        Network.shared.apollo.fetch(query: CourseInfoQuery(user: user)){ result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let result):
                let data = result.data!
                print(data)
                
                var completionDict: [String: Int] = [:]
                
                data.completions?.enumerated().forEach { (index, completion) -> () in
                    completionDict[completion?.course ?? ""] = index
                }
                
                self.courses.append(contentsOf: data.courses!.map { course -> CourseData in
                    
                    var completionItem: CourseInfoQuery.Data.Completion?
                    if let i = completionDict[course!.name] {
                        completionItem = data.completions![i]
                    }else {
                        completionItem = nil
                    }
                    
                    return CourseData(id: UUID(uuidString: UUID().uuidString)!, name: course!.name, correct: completionItem?.points ?? 0, questions: course!.questionCount, completed: completionItem?.completed ?? false, attempts: completionItem?.numberOfTries ?? 0)
                })
            }
        }
    }
}
