//
//  GraphQLRequests.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/17/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import Alamofire

class GraphQLRequests {
    
    let url = "http://localhost:4000/graphql"
    
    func getAllClasses(){
        let reqDict: [:]
        AF.request(url, method: .post)
    }
    
    func getClass(class: String){
        
    }
}
