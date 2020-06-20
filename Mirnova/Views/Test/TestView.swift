//
//  TestView.swift
//  Mirnova
//
//  Created by Josh Sauder on 6/20/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit

extension TestViewController {
    
    func setupView() {
        PromptLabel.text = "Select One"
        
        setUpButtons(button: AButton)
        setUpButtons(button: BButton)
        setUpButtons(button: CButton)
        setUpButtons(button: DButton)
    }
    
    private func setUpButtons(button: UIButton){
        button.layer.cornerRadius = 0.5 * button.bounds.width
        button.clipsToBounds = true
        button.backgroundColor = .green
    }
}
