//
//  ImageCache.swift
//  Mirnova
//
//  Created by Josh Sauder on 10/26/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit

struct ImageCache {
    
    /**
    Deletes all images in the cache
     */
    static func deleteAll() {
        guard let imagePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return;
        }
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: imagePath,
                                                                       includingPropertiesForKeys: nil,
                                                                       options: .skipsHiddenFiles)
            for fileURL in fileURLs {
                if fileURL.pathExtension == "png" {
                    try FileManager.default.removeItem(at: fileURL)
                }
            }
        } catch  { print(error) }
        
    }
    
    /**
    Retrieves an image in the cache
     
     - parameters:
        - name: The name of the image
     */
    static func retrieve(imageNamed name: String) -> UIImage? {
        guard let imagePath = ImageCache.path(for: name) else {
            return nil
        }
        
        return UIImage(contentsOfFile: imagePath.path)
    }
    
    /**
    Stores an image in the cache
     
     - parameters:
        - image: The UIImage
        - name: The name of the image
     */
    static func store(image: UIImage, name: String) throws {
        
        guard let imageData = image.pngData() else {
            throw NSError(domain: "com.thecodedself.imagestore", code: 0, userInfo: [NSLocalizedDescriptionKey: "The image could not be created"])
        }
        
        guard let imagePath = ImageCache.path(for: name) else {
            throw NSError(domain: "com.thecodedself.imagestore", code: 0, userInfo: [NSLocalizedDescriptionKey: "The image path could not be retrieved"])
        }
        
        try imageData.write(to: imagePath)
    }
    
    /**
     Retrieves the path of the image
     - parameters:
        - for: The image name
        - fileExtension: The extension of the file. Defaults to png
     */
    private static func path(for imageName: String, fileExtension: String = "png") -> URL? {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return directory?.appendingPathComponent("\(imageName).\(fileExtension)")
    }
}
