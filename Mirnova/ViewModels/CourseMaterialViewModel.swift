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
    
    init(name: String) {
        self.name = name
    }
    
    public func load(){
        fetchData(){ material in
            self.fetchImages(material: material){ images in
                self.courseMaterial = material.enumerated().map{(idx, item) in
                    return self.buildCourseMaterial(question: item, image: images[idx])
                }
            }
        }
    }
    
    
    private func fetchData(completion: @escaping ([CourseQuery.Data.Course.Question]) -> ()){
        print(name)
        Network.shared.apollo.fetch(query: CourseQuery(name: name)){ result in
            
            switch result {
            case .failure(let error):
                    print(error)
            case .success(let result):
                let data = result.data!
                completion(data.course?.questions ?? [])
            }
            
        }
        
    }
    
    private func fetchImages(material: [CourseQuery.Data.Course.Question], completion: @escaping ([UIImage]) -> ()){
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
    
    private func buildCourseMaterial(question: CourseQuery.Data.Course.Question, image: UIImage?) -> CourseMaterial {
        return CourseMaterial(id: UUID(),
                              imageString: question.image,
                              image: image ?? UIImage(),
                              question: question.question,
                              answer: question.answer)
    }
}
