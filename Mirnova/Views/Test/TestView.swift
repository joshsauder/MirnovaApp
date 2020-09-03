//
//  TestView.swift
//  Mirnova
//
//  Created by Josh Sauder on 6/20/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

extension TestViewController {
    
    /**
     Sets up the  view items
     */
    func setupView() {
        PromptLabel.text = "Select One"
        
        setUpButtons(button: AButton)
        setUpButtons(button: BButton)
        setUpButtons(button: CButton)
        setUpButtons(button: DButton)
    }
    
    /**
     Sets up a given button
     - parameters:
        - button: The UIButton
     */
    private func setUpButtons(button: UIButton){
        //set up button attributes
        button.layer.cornerRadius = 0.15 * button.bounds.width
        button.clipsToBounds = true
        button.backgroundColor = .white
        
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 4
        
        //add shadow
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 8)
        button.layer.shadowOpacity = 1

    }
    
    /**
     Adds the SignImageView SwiftUI View to the Sign Image UIView
     - parameters:
        - imageModel: The model container the currently displayed image
     */
    func initImageView(imageModel: SignImageViewModel){
        let subView = UIHostingController(rootView: SignImageView(imageModel: imageModel))
        SignImage.addSubview(subView.view)
        subView.view.translatesAutoresizingMaskIntoConstraints = false
        subView.view.topAnchor.constraint(equalTo:SignImage.topAnchor).isActive = true
        subView.view.bottomAnchor.constraint(equalTo:SignImage.bottomAnchor).isActive = true
        subView.view.leftAnchor.constraint(equalTo:SignImage.leftAnchor).isActive = true
        subView.view.rightAnchor.constraint(equalTo:SignImage.rightAnchor).isActive = true
    }
}
