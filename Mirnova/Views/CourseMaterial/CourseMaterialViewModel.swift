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
                print(data)
            }
            
        }
        
    }
    
    func handleClick() {
        print("test")
    }
}
