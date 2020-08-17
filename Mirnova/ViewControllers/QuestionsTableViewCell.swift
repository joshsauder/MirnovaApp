//
//  QuestionsTableViewCell.swift
//  Mirnova
//
//  Created by Josh Sauder on 7/9/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit

class QuestionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var SignImage: UIImageView!
    @IBOutlet weak var CorrectLabel: UILabel!
    @IBOutlet weak var InputLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    /**
    Sets up Question Views labels
     - parameters:
        - correct: Boolean that determines if question was answered correctly
     */
    func setLabels(correct: Bool){
        if(correct){
            InputLabel.textColor = .green
            CorrectLabel.textColor = .green
        } else{
//            let range = NSMakeRange(0, InputLabel.text!.count)
//            let strikeThrough = NSMutableAttributedString(string: InputLabel.text!)
//            strikeThrough.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single, range: range)
//            strikeThrough.addAttribute(.strikethroughColor, value: UIColor.red, range: range)
//            strikeThrough.addAttribute(.foregroundColor, value: UIColor.red, range: range)
//
//            InputLabel.attributedText = strikeThrough
            InputLabel.textColor = .red
            CorrectLabel.textColor = .green
        }
    }
}
