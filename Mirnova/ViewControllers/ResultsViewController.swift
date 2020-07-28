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

class ResultViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var FinalScoreLabel: UILabel!
    
    @IBOutlet weak var ResultImage: UIImageView!
    @IBOutlet weak var InfoView: UIView!
    
    @IBOutlet weak var PassLabel: UILabel!
    @IBOutlet weak var CorrectLabel: UILabel!
    @IBOutlet weak var IncorrectLabel: UILabel!
    @IBOutlet weak var AttemptsLabel: UILabel!
    @IBOutlet weak var AverageScoreLabel: UILabel!
    
    @IBOutlet weak var QuestionsTableView: UITableView!
    @IBOutlet weak var ScrollView: UIScrollView!
    
    var userAnswers: [[String: String]] = []
    var courseMaterial: [CourseMaterial] = []
    var totalCorrect: Int = 0
    var attempts: Int = 0
    var average: Double = 0
    var passed: Bool = false
    
    final var scrollViewContentHeight = 1200 as CGFloat
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionsTableView.dataSource = self
        
        self.setUpView(correct: totalCorrect, incorrect: userAnswers.count, attempts: attempts, average: average, passed: passed)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userAnswers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = QuestionsTableView.dequeueReusableCell(withIdentifier: "QuestionsTableViewCell") as! QuestionsTableViewCell
        
        let data = userAnswers[indexPath.row]
        cell.SignImage.image = courseMaterial[indexPath.row].image
        cell.InputLabel.text = data["input"] == data["answer"] ? "" : data["input"]
        cell.CorrectLabel.text = data["input"]
        cell.setLabels(correct: data["input"] == data["answer"])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        if scrollView == self.ScrollView {
            if yOffset >= scrollViewContentHeight - UIScreen.main.bounds.height {
                ScrollView.isScrollEnabled = false
                QuestionsTableView.isScrollEnabled = true
            }
        }
        
        if scrollView == self.QuestionsTableView {
            if yOffset <= 0 {
                ScrollView.isScrollEnabled = true
                QuestionsTableView.isScrollEnabled = false
            }
        }
    }
}

struct ResultViewRepresentation: UIViewControllerRepresentable {
    var userAnswers: [[String: String]]
    var courseMaterial: [CourseMaterial]
    var totalCorrect: Int
    var passed: Bool
    var attempts: Int
    var average: Double
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ResultViewRepresentation>) -> ResultViewController {
        
        let storyboard = UIStoryboard(name: "Results", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultViewController
        
        vc.userAnswers = userAnswers
        vc.courseMaterial = courseMaterial
        vc.totalCorrect = totalCorrect
        vc.passed = passed
        vc.attempts = attempts
        vc.average = average
        
        return vc
    }

    func updateUIViewController(_ uiViewController: ResultViewController, context: UIViewControllerRepresentableContext<ResultViewRepresentation>) {
    }
    
    
}
