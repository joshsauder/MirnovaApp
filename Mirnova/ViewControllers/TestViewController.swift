
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

protocol TestViewDelegate: AnyObject {
    func updateAttempted(sender: TestViewController)
}

class TestViewController: UIViewController {

    @IBOutlet weak var SignImage: UIImageView!
    @IBOutlet weak var PromptLabel: UILabel!
    
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var CButton: UIButton!
    @IBOutlet weak var DButton: UIButton!
    
    weak var delegate: TestViewDelegate?
    
    var courseMaterial: [CourseMaterial] = []
    var totalCorrect: Int = 0
    var totalAttempted: Int = 0
    var correctIdx: Int = 0
    
    var userAnswers: [[String: String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //style view
        setupView()
        
        //randomize questions
        courseMaterial.shuffle()
        setViewItems()
    }
    

    /**
     Sets up Test View items
     */
    func setViewItems(){
        let currentItem = courseMaterial[totalAttempted]
        
        //set up options and set images
        DispatchQueue.main.async {
            self.delegate?.updateAttempted(sender: self)
            self.setOptions(currentItem: currentItem)
            self.SignImage.image = currentItem.image
        }
    }
    
    /**
     Fired if first button is tapped
     - parameters:
        - sender: Button that is interacted with
     */
    @IBAction func TouchAButton(_ sender: Any) {
        processAnswer(input: 0)
    }
    
    /**
    Fired if second button is tapped
    - parameters:
       - sender: Button that is interacted with
    */
    @IBAction func TouchBButton(_ sender: Any) {
        processAnswer(input: 1)
    }
    
    /**
    Fired if third button is tapped
    - parameters:
       - sender: Button that is interacted with
    */
    @IBAction func TouchCButton(_ sender: Any) {
       processAnswer(input: 2)
    }
    
    /**
    Fired if fourth button is tapped
    - parameters:
       - sender: Button that is interacted with
    */
    @IBAction func TouchDButton(_ sender: Any) {
        processAnswer(input: 3)
    }
    
    /**
     Determines if given answer is correct
     - parameters:
        - input: Answer user gave
     */
    func processAnswer(input: Int){
        var answer: [String: String] = [:]
        
        answer["input"] = mapAnswer(answer: input)
        answer["answer"] = mapAnswer(answer: correctIdx)
        userAnswers.append(answer)
        
        if correctIdx == input {
            totalCorrect += 1
        }
        
        totalAttempted += 1
        
        //next question
        setViewItems()
    }
    
    /**
     Maps answer to button
     - parameters:
        - answer: Integer that maps to button user tapped
     */
    private func mapAnswer(answer: Int) -> String {
        switch (answer) {
        case 0:
            return "A"
        case 1:
            return "B"
        case 2:
            return "C"
        default:
            return "D"
        }
    }
 
    
    /**
     Sets up the buttons to next question
     - parameters:
        - currentItem: Next question item
     */
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
    
    /**
     Generates an array of 4 random numbers
     - parameters:
        - numQuestions: The number of questions in  course
     */
    func generateRandomNumbers(numQuestions: Int) -> [Int] {
        var randomSet = Set<Int>()
        correctIdx = Int.random(in: 0 ... 3)
        
        while randomSet.count < 3 {
            let randomNum = Int.random(in: 0 ..< numQuestions)
            randomSet.insert(randomNum)
        }
        
        return Array(randomSet)
    }
}

struct TestViewControllerRepresentation: UIViewControllerRepresentable {
    var courseMaterial: [CourseMaterial]
    @Binding var questionsAttempted: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<TestViewControllerRepresentation>) -> TestViewController {
        let storyboard = UIStoryboard(name: "Test", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        
        vc.courseMaterial = courseMaterial
        vc.delegate = context.coordinator
        
        return vc
    }

    func updateUIViewController(_ uiViewController: TestViewController, context: UIViewControllerRepresentableContext<TestViewControllerRepresentation>) {
    }
    
    class Coordinator: NSObject, TestViewDelegate {
        var parent: TestViewControllerRepresentation
        
        init(_ testViewController: TestViewControllerRepresentation){
            parent = testViewController
        }
        
        /**
         Updates the questions attempted in parent SwiftUI view
         - parameters:
            - sender: The UIKit view
         */
        func updateAttempted(sender: TestViewController){
            parent.questionsAttempted = sender.totalAttempted
        }
    }
}
