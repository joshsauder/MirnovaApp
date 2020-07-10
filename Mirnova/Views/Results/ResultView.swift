//
//  ResultView.swift
//  Mirnova
//
//  Created by Josh Sauder on 7/9/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit

extension ResultViewController {
    
    /**
    Sets up Result View
     - parameters:
        - correct: Number of correct questions
        - incorrect: Number of incorrect questions
        - attempt: Number of attemps
        - average: Average correct for course
        - passed: Booleen determining if user passed
     */
    func setUpView(correct: Int, incorrect: Int, attempts: Int, average: Int, passed: Bool){
        setLabels(correct: correct, incorrect: incorrect, attempts: attempts, average: average, passed: passed)
        setImage(passed: passed)
    }
    
    /**
    Sets up Labels
     - parameters:
        - correct: Number of correct questions
        - incorrect: Number of incorrect questions
        - attempt: Number of attemps
        - average: Average correct for course
        - passed: Booleen determining if user passed
     */
    private func setLabels(correct: Int, incorrect: Int, attempts: Int, average: Int, passed: Bool){
        self.FinalScoreLabel.text = "Final Score \n\(correct)/\(correct+incorrect)"
        
        self.CorrectLabel.text = "\(correct)"
        self.IncorrectLabel.text = "\(incorrect)"
        self.AttemptsLabel.text = "\(attempts)"
        self.AverageScoreLabel.text = "\(average)%"
        
        self.PassLabel.text = passed ? "You Passed!" : "Try Again"
    }
    
    /**
    Sets up Result Image
     - parameters:
        - passed: Booleen determining if user passed
     */
    private func setImage(passed: Bool){
        let image =  passed ? "checkmark.cirle" : "xmark.circle"
        let color = passed ? UIColor.green : UIColor.red
        self.ResultImage.image = UIImage(systemName: image)
        self.ResultImage.tintColor = color
    }
}
