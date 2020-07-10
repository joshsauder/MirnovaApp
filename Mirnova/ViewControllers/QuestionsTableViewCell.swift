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
}
