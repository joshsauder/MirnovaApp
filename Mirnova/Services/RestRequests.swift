//
//  RestRequests.swift
//  Mirnova
//
//  Created by Josh Sauder on 6/17/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import Alamofire
import Amplify

class RestRequests {
        
    public func getImage(image: String, completion: @escaping (UIImage?) -> ()){
        Amplify.Storage.downloadData(key: image,
            resultListener: { event in
                switch(event){
                case let .success(data):
                    completion(UIImage(data: data))
                case let .failure(storageError):
                    print("Failed: \(storageError.errorDescription). \(storageError.underlyingError)")
            }

        })
    }
    
}
