//
//  ResultsViewController.swift
//  Mirnova
//
//  Created by Josh Sauder on 7/6/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class ResultViewController: UIViewController {
    
    @IBOutlet weak var FinalScoreLabel: UILabel!
    
    @IBOutlet weak var ResultImage: UIImageView!
    
    @IBOutlet weak var PassLabel: UILabel!
    @IBOutlet weak var CorrectLabel: UILabel!
    @IBOutlet weak var IncorrectLabel: UILabel!
    @IBOutlet weak var AttemptsLabel: UILabel!
    @IBOutlet weak var AverageScoreLabel: UILabel!
    
    @IBOutlet weak var QuestionsStackView: UITableView!
    
    var userAnswers: [[String: String]] = []
    var totalCorrect: Int = 0
    var totalQuestions: Int = 0
    var attempts: Int = 0
    var average: Int = 0
    var passed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpView(correct: totalCorrect, incorrect: totalQuestions, attempts: attempts, average: average, passed: passed)
    }
    
    
}

struct ResultViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ResultViewRepresentable>) -> ResultViewController {
        let storyboard = UIStoryboard(name: "Test", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Results") as! ResultViewController
        
        return vc
    }

    func updateUIViewController(_ uiViewController: ResultViewController, context: UIViewControllerRepresentableContext<ResultViewRepresentable>) {
    }
    
    
}
