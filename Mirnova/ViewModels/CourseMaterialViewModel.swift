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

    var courseData: CourseData
    @Published var courseMaterial: [CourseMaterial] = []
    
    init(courseData: CourseData) {
        self.courseData = courseData
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
        Network.shared.apollo.fetch(query: CourseQuery(name: courseData.name)){ result in
            
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
        
        var removedAllImages = false
        
        if ImageCache.retrieve(imageNamed: material[0].image) == nil {
            ImageCache.deleteAll()
            removedAllImages = true
        }

        for (i, course) in material.enumerated() {
            group.enter()
            var image: UIImage? = nil
            if !removedAllImages {
                image = ImageCache.retrieve(imageNamed: course.image)
            }
            
            if image == nil {
                req.getImage(image: "\(self.courseData.name)/\(course.image)"){
                    images[i] = $0 ?? UIImage()
                    
                    do {
                        try ImageCache.store(image: $0 ?? UIImage(), name: course.image)
                    } catch{ print(error) }
                }
            } else {
                images[i] = image!
            }
            group.leave()
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
