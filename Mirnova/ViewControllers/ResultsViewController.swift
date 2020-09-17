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

class ResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var FinalScoreLabel: UILabel!
    @IBOutlet weak var InfoView: UIView!
    @IBOutlet weak var ResultCircleView: UIView!
    
    @IBOutlet weak var PassLabel: UILabel!
    @IBOutlet weak var CorrectLabel: UILabel!
    @IBOutlet weak var IncorrectLabel: UILabel!
    @IBOutlet weak var AttemptsLabel: UILabel!
    @IBOutlet weak var AverageScoreLabel: UILabel!
    
    @IBOutlet weak var QuestionsTableView: UITableView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var ContentView: UIView!
    
    var userAnswers: [[String: String]] = []
    var courseMaterial: [CourseMaterial] = []
    var totalCorrect: Int = 0
    var attempts: Int = 0
    var average: Double = 0
    var passed: Bool = false
    var callback: (() -> Void)?
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        QuestionsTableView.dataSource = self
        QuestionsTableView.delegate = self
        
        QuestionsTableView.isScrollEnabled = false
        ScrollView.contentInsetAdjustmentBehavior = .never
        
        self.setUpView(correct: totalCorrect, incorrect: userAnswers.count, attempts: attempts, average: average, passed: passed)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.callback?()
    }
}

/**
 UITableViewDelegate and UIScrollView  specific functions
 */
extension ResultViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAnswers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.QuestionsTableView.dequeueReusableCell(withIdentifier: "QuestionsTableViewCell") as! QuestionsTableViewCell

        let data = userAnswers[indexPath.row]
        cell.SignImage.image = courseMaterial[indexPath.row].image
        cell.InputLabel.text = data["input"] == data["answer"] ? "" : data["input"]
        cell.CorrectLabel.text = data["answer"]
        cell.setLabels(correct: data["input"] == data["answer"])
                
        if indexPath.row  == 0 {
            let prevSize = tableViewHeight.constant
            tableViewHeight.constant = cell.frame.height * CGFloat(userAnswers.count)
            ScrollView.contentSize.height = ScrollView.contentSize.height + (tableViewHeight.constant - prevSize)
//            ContentView.frame.size.height = ContentView.frame.height + (tableViewHeight.constant - prevSize)
            InfoView.frame.size.height = InfoView.frame.size.height + (tableViewHeight.constant - prevSize)
       }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.ScrollView {
            self.QuestionsTableView.isScrollEnabled = (self.ScrollView.contentOffset.y >= 0)
        }
        
        if scrollView == self.QuestionsTableView {
            self.QuestionsTableView.isScrollEnabled = (self.QuestionsTableView.contentOffset.y > 0)
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
    var callback: (() -> Void)?
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ResultViewRepresentation>) -> ResultViewController {
        
        let storyboard = UIStoryboard(name: "Results", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultViewController
        
        vc.userAnswers = userAnswers
        vc.courseMaterial = courseMaterial
        vc.totalCorrect = totalCorrect
        vc.passed = passed
        vc.attempts = attempts
        vc.average = average
        vc.callback = callback
        
        return vc
    }

    func updateUIViewController(_ uiViewController: ResultViewController, context: UIViewControllerRepresentableContext<ResultViewRepresentation>) {
    }
    
    
}
