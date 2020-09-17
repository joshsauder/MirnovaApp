
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
    func updateCorrect(sender: TestViewController)
}

class TestViewController: UIViewController {

    @IBOutlet weak var SignImage: UIView!
    @IBOutlet weak var PromptLabel: UILabel!
    
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var CButton: UIButton!
    @IBOutlet weak var DButton: UIButton!
        
    var delegate: TestViewDelegate?
    @ObservedObject var imageModel: SignImageViewModel = SignImageViewModel(image: UIImage())
    
    var course: String = ""
    var courseMaterial: [CourseMaterial] = []
    var totalCorrect: Int = 0
    var totalAttempted: Int = 0
    var correctIdx: Int = 0
    
    var userAnswers: [[String: String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //style view
        setupView()
        initImageView(imageModel: imageModel)
        
        //randomize questions
        courseMaterial.shuffle()
        setViewItems()
    }

    /**
     Sets up Test View items
     */
    func setViewItems(){
        //if all questions were answered, present results
        if(totalAttempted == courseMaterial.count){
            let passed:Bool = Double(totalCorrect)/Double(courseMaterial.count) > 0.75
            self.postResults(passed: passed){ numTries, avg in
                self.presentResults(passed: passed, numTries: numTries, average: avg)
            }
            
        } else {
            let currentItem = courseMaterial[totalAttempted]
            
            //set up options and set images
            DispatchQueue.main.async {
                self.imageModel.image = currentItem.image
                self.setOptions(currentItem: currentItem)
            }
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
    
        
        DispatchQueue.main.async {
            //if correct answer given, will override the red and use green instead
            self.colorButtons(index: input, color: Colors.RED)
            self.colorButtons(index: self.correctIdx, color: Colors.GREEN)
            self.toggleEnableButtons()
            
            self.delegate?.updateAttempted(sender: self)
            if self.correctIdx == input {
                self.totalCorrect += 1
                self.delegate?.updateCorrect(sender: self)
            }
        }
        
        totalAttempted += 1
        
        //after 3 seconds, show next question
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.colorButtons(index: input, color: Colors.WHITE)
            self.colorButtons(index: self.correctIdx, color: Colors.WHITE)
            self.toggleEnableButtons()
            
            self.setViewItems()
        }
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
    
    /**
     Posts the users test results
     - parameters:
        - passed: Boolean deteriming if user passed
        - completion: On completion, return number of tries and average
     */
    func postResults(passed: Bool, completion: @escaping (Int, Double) -> ()){
        Network.shared.apollo.perform(mutation: UpdateCompletionMutation(completion: CompletionInput(user: "test", course: course, completed: passed, points: totalCorrect))) { result in
            guard let data = try? result.get().data else { return }
            completion(data.updateCompletion.numberOfTries, data.updateCompletion.average)
        }
    }
    
    /**
     Presents Results View and CourseView when the Results View is dismissed
     - parameters:
        - passed: Boolean deteriming if user passed
        - numTries: The number of attempts the user has at the course
        - average: Users average score
     */
    func presentResults(passed: Bool, numTries: Int, average: Double){
        let initalVC = UIHostingController(rootView: CourseView(model: CourseViewModel(user: "test")))
        initalVC.modalPresentationStyle = .fullScreen
        //consider adding int to keep track of number needed to pass
        let passed:Bool = Double(totalCorrect)/Double(courseMaterial.count) > 0.75
        let vc = UIHostingController(rootView: ResultsUIView(userAnswers: userAnswers, courseMaterial: courseMaterial, totalCorrect: totalCorrect, passed: passed, attempts: numTries, average: average, callback: {
            self.present(initalVC, animated: true, completion: nil)
        }))
        
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
    
}

struct TestViewControllerRepresentation: UIViewControllerRepresentable {
    var courseMaterial: [CourseMaterial]
    var course: String
    @Binding var correct: Int
    @Binding var completed: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<TestViewControllerRepresentation>) -> TestViewController {
        let storyboard = UIStoryboard(name: "Test", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        
        vc.course = course
        vc.courseMaterial = courseMaterial
        vc.delegate = context.coordinator
        
        return vc
    }

    func updateUIViewController(_ uiViewController: TestViewController, context: UIViewControllerRepresentableContext<TestViewControllerRepresentation>) {
    }
    
    class Coordinator: NSObject, TestViewDelegate {
        var parent: TestViewControllerRepresentation

        init(_ parent: TestViewControllerRepresentation){
            self.parent = parent
        }

        /**
         Updates the questions attempted in parent SwiftUI view
         - parameters:
            - sender: The UIKit view
         */
        @objc func updateAttempted(sender: TestViewController){
            parent.completed += 1
        }

        /**
        Updates the questions correct in parent SwiftUI view
        - parameters:
           - sender: The UIKit view
        */
        @objc func updateCorrect(sender: TestViewController){
            parent.correct += 1
        }
    }
}
