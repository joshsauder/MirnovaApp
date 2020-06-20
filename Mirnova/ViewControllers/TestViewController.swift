
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

class TestViewController: UIViewController {

    @IBOutlet weak var SignImage: UIImageView!
    @IBOutlet weak var PromptLabel: UILabel!
    
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var CButton: UIButton!
    @IBOutlet weak var DButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct TestViewControllerRepresentation: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<TestViewControllerRepresentation>) -> TestViewController {
        UIStoryboard(name: "Test", bundle: nil).instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
    }

    func updateUIViewController(_ uiViewController: TestViewController, context: UIViewControllerRepresentableContext<TestViewControllerRepresentation>) {

    }
}
