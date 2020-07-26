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
    func setUpView(correct: Int, incorrect: Int, attempts: Int, average: Double, passed: Bool){
        setInfoView(passed: passed)
        setLabels(correct: correct, incorrect: incorrect, attempts: attempts, average: average, passed: passed)
        setImage(passed: passed)
    }
    
    /**
     Sets up info view
     - parameters:
        - passed: Booleen determining if user passed
     */
    func setInfoView(passed: Bool){
        self.InfoView.backgroundColor = passed ? .green : .red
        self.InfoView.clipsToBounds = true
        self.InfoView.layer.cornerRadius = 10
        self.InfoView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
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
    private func setLabels(correct: Int, incorrect: Int, attempts: Int, average: Double, passed: Bool){
        self.FinalScoreLabel.text = "Final Score \n\(correct)/\(correct+incorrect)"
        self.FinalScoreLabel.textColor = passed ? .green : .red
        
        self.CorrectLabel.text = "\(correct)"
        self.CorrectLabel.textColor = .white
        self.IncorrectLabel.text = "\(incorrect)"
        self.IncorrectLabel.textColor = .white
        self.AttemptsLabel.text = "\(attempts)"
        self.AttemptsLabel.textColor = .white
        self.AverageScoreLabel.text = "\(average)%"
        self.AverageScoreLabel.textColor = .white
        
        self.PassLabel.text = passed ? "You Passed!" : "Try Again"
        self.PassLabel.textColor = .white
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
