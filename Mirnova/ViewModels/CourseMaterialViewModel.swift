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
    @Published var courseMaterial: [CourseMaterial] = []
    @Published var images: [UIImage] = []
    
    init(name: String) {
        self.name = name
    }
    
    public func load(){
        fetchData(){ material in
            self.fetchImages(material: material){
                self.images = $0
                self.courseMaterial = material
            }
        }
    }
    
    
    private func fetchData(completion: @escaping ([CourseMaterial]) -> ()){
        print(name)
        Network.shared.apollo.fetch(query: CourseQuery(name: name)){ result in
            
            switch result {
            case .failure(let error):
                    print(error)
            case .success(let result):
                let data = result.data!
                completion(data.course?.questions.map({ self.buildCourseMaterial(question: $0)}) ?? [])
            }
            
        }
        
    }
    
    private func fetchImages(material: [CourseMaterial], completion: @escaping ([UIImage]) -> ()){
        let req = RestRequests()
        var images = [UIImage](repeating: UIImage(), count: material.count)
        let group = DispatchGroup()

        for (i, course) in material.enumerated() {
            group.enter()
            req.getImage(image: "\(self.name)/\(course.image)"){
                images[i] = $0 ?? UIImage()
                group.leave()
            }
        }
        
        group.notify(queue: .main){
            completion(images)
        }
    }
    
    private func buildCourseMaterial(question: CourseQuery.Data.Course.Question) -> CourseMaterial {
        return CourseMaterial(id: UUID(),
                              image: question.image,
                              question: question.question,
                              answer: question.answer)
    }
}
