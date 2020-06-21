
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
    
    var correctIdx: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //randomize questions
        courseMaterial.shuffle()
        setViewItems()
    }
    
    func setViewItems(){
        let currentItem = courseMaterial[totalAttempted]
        
        //set up options and set images
        setOptions(currentItem: currentItem)
        SignImage.image = currentItem.image
    }
    
    @IBAction func TouchAButton(_ sender: Any) {
        processAnswer(input: 0)
    }
    
    
    @IBAction func TouchBButton(_ sender: Any) {
        processAnswer(input: 1)
    }
    
    @IBAction func TouchCButton(_ sender: Any) {
       processAnswer(input: 2)
    }
    
    @IBAction func TouchDButton(_ sender: Any) {
        processAnswer(input: 3)
    }
    
    func processAnswer(input: Int){
        if correctIdx == input {
            totalCorrect += 1
        }
        totalAttempted += 1
        setOptions(currentItem: courseMaterial[totalAttempted])
    }
    
    func setOptions(currentItem: CourseMaterial){
        let randomNums = generateRandomNumbers(numQuestions: courseMaterial.count)
        let firstIncorrect = courseMaterial[randomNums[0]]
        let secondIncorrect = courseMaterial[randomNums[1]]
        let thirdIncorrect = courseMaterial[randomNums[2]]
        
        switch correctIdx{
        case 0:
            //A is correct
            AButton.setTitle(currentItem.answer, for: .normal)
            
            BButton.setTitle(firstIncorrect.answer, for: .normal)
            CButton.setTitle(secondIncorrect.answer, for: .normal)
            DButton.setTitle(thirdIncorrect.answer, for: .normal)
        case 1:
            //B is correct
            BButton.setTitle(currentItem.answer, for: .normal)
            
            AButton.setTitle(firstIncorrect.answer, for: .normal)
            CButton.setTitle(secondIncorrect.answer, for: .normal)
            DButton.setTitle(thirdIncorrect.answer, for: .normal)
        case 2:
            //C is correct
            CButton.setTitle(currentItem.answer, for: .normal)
            
            AButton.setTitle(firstIncorrect.answer, for: .normal)
            BButton.setTitle(secondIncorrect.answer, for: .normal)
            DButton.setTitle(thirdIncorrect.answer, for: .normal)
            
        default:
            //D is correct
            DButton.setTitle(currentItem.answer, for: .normal)
            
            AButton.setTitle(firstIncorrect.answer, for: .normal)
            BButton.setTitle(secondIncorrect.answer, for: .normal)
            CButton.setTitle(thirdIncorrect.answer, for: .normal)
        }
    }
    
    func generateRandomNumbers(numQuestions: Int) -> [Int] {
        var randomSet = Set<Int>()
        correctIdx = Int.random(in: 0 ... 2)
        
        while randomSet.count < 3 {
            let randomNum = Int.random(in: 0 ..< numQuestions)
            randomSet.insert(randomNum)
        }
        
        return Array(randomSet)
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
