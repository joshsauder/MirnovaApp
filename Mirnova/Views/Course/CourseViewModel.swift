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
    
    let user = "test"
    
    init() {
        fetchData()
    }
    
    var courses: [CourseData] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchData(){
        let apolloClient = getApolloClient()
        
        apolloClient.fetch(query: CourseInfoQuery(user: user)){ result in
            guard let data = try? result.get().data else { return }
            
            var completionDict: [String: Int] = [:]
            
            data.completions!.enumerated().forEach { (index, completion) -> () in
                 completionDict[completion!.course] = index
            }
            
            self.courses = data.courses!.map { course -> CourseData in
                
                var completionItem: CourseInfoQuery.Data.Completion?
                if let i = completionDict[course!.name] {
                    completionItem = data.completions![i]
                }else {
                    completionItem = nil
                }
                
                return CourseData(id: UUID(uuidString: UUID().uuidString)!, name: course!.name, correct: completionItem?.points ?? 0, questions: course!.questionCount, completed: completionItem?.completed ?? false, attempts: completionItem?.numberOfTries ?? 0)
            }
        }
    }
}
