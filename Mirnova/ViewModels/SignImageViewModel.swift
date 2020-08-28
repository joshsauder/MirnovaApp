//
//  SignImageViewModel.swift
//  Mirnova
//
//  Created by Josh Sauder on 8/27/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI
import Combine

class SignImageViewModel: ObservableObject {
    @Published var image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    /**
     Updates the models image
     - parameters:
        - image: The new UIImage
     */
    func updateImage(image: UIImage){
        self.image = image
    }
}
