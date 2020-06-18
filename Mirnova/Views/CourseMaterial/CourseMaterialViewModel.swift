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
    var images: [UIImage] = []
    
    init(name: String) {
        self.name = name
        fetchData(){
            self.fetchImages(){ self.images = $0 }
        }
    }
    
    
    private func fetchData(completion: @escaping () -> ()){
        Network.shared.apollo.fetch(query: CourseQuery(name: name)){ result in
            
            switch result {
            case .failure(let error):
                    print(error)
            case .success(let result):
                let data = result.data!
                self.courseMaterial = data.course?.questions.map({ self.buildCourseMaterial(question: $0)}) ?? []
                completion()
            }
            
        }
        
    }
    
    private func fetchImages(completion: @escaping ([UIImage]) -> ()){
        let req = RestRequests()
        var images: [UIImage] = []
        let group = DispatchGroup()
    
        for (i, course) in courseMaterial.enumerated() {
            group.enter()
            req.getImage(image: course.image){
                images.insert($0 ?? UIImage(), at: i)
                group.leave()
            }
        }
        
        group.notify(queue: .main){
            completion(images)
        }
    }
    
    private func buildCourseMaterial(question: CourseQuery.Data.Course.Question) -> CourseMaterial {
        return CourseMaterial(id: UUID(),
                              image: question.images?[0] ?? "",
                              question: question.question,
                              answer: question.answer)
    }
    
    func handleClick() {
        print("test")
    }
}
