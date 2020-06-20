
//
//  Test.swift
//  Mirnova
//
//  Created by Josh Sauder on 6/19/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class TestViewController: UIViewController {

    @IBOutlet weak var SignImage: UIImageView!
    @IBOutlet weak var PromptLabel: UILabel!
    
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var CButton: UIButton!
    @IBOutlet weak var DButton: UIButton!
    
    var courseMaterial: [CourseMaterial] = []
    var totalCorrect: Int = 0
    var totalAttempted: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignImage.image = courseMaterial[0].image
    }
    
    
    func nextQuestion(){
        totalAttempted += 1
        
        let currentItem = courseMaterial[totalAttempted]
        
        
        
        SignImage.image = currentItem.image
    }
    
}

struct TestViewControllerRepresentation: UIViewControllerRepresentable {
    var courseMaterial: [CourseMaterial]
    func makeUIViewController(context: UIViewControllerRepresentableContext<TestViewControllerRepresentation>) -> TestViewController {
        let storyboard = UIStoryboard(name: "Test", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        
        vc.courseMaterial = courseMaterial
        return vc
    }

    func updateUIViewController(_ uiViewController: TestViewController, context: UIViewControllerRepresentableContext<TestViewControllerRepresentation>) {

    }
}
