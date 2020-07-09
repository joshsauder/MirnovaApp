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
