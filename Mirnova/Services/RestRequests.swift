//
//  RestRequests.swift
//  Mirnova
//
//  Created by Josh Sauder on 6/17/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import Alamofire

class RestRequests {
    
    let endpoint = "http://localhost:8080"
    
    public func getImage(image: String, completion: @escaping (UIImage?) -> ()){
        AF.request("\(endpoint)/course/images?image=\(image)", method: .get).responseData{ response in
            switch response.result{
            case .success:
                let image = UIImage(data: response.data!)
                completion(image ?? nil)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }

}
