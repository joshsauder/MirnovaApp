//
//  TextCache.swift
//  Mirnova
//
//  Created by Josh Sauder on 12/8/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation

struct TextCache {
    
    private static let cache = NSCache<NSString, NSString>()
    private static let USER_ID = "userId"
    
    static func getUserId() -> String{
        return cache.object(forKey: NSString(string: USER_ID))! as String
    }
    
    static func setUserId(user: String){
        cache.setObject(NSString(string: user), forKey: NSString(string: USER_ID))
    }
}
