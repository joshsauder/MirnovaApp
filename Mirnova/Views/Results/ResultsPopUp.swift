//
//  ResultsPopUp.swift
//  Mirnova
//
//  Created by Josh Sauder on 9/19/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import SwiftEntryKit
import SwiftUI

class ResultsPopUp {
    static func displayPopUp(passed: Bool, vc: UIViewController) {
        var attributes = EKAttributes()
        attributes = .centerFloat
        attributes.displayDuration = .infinity
        attributes.popBehavior = .animated(animation: .translation)
        attributes.entryBackground = .color(color: .init(Colors.GREEN))
                
        let image = EKProperty.ImageContent(image: determineImage(passed: passed), size: CGSize(width: 70, height: 70))
        let titleText = passed ? "You passed" : "Try Again"
        let label = EKProperty.LabelContent(text: titleText, style: .init(font: .systemFont(ofSize: 12), color: .white))
        
        
        let buttonContent = EKProperty.LabelContent(text: "Finished", style: .init(font: .systemFont(ofSize: 12), color: .init(Colors.GREEN)))
        let button = EKProperty.ButtonContent(label: buttonContent, backgroundColor: .white, highlightedBackgroundColor: .init(Colors.GRAY))
        
        let popUp = EKPopUpMessage(themeImage: EKPopUpMessage.ThemeImage.init(image: image), title: label, description: EKProperty.LabelContent(text: "", style: .init(font: .systemFont(ofSize: 12), color: .white)), button: button) {
            showCourseView(vc: vc)
        }
        let contentView = EKPopUpMessageView(with: popUp)
        
        SwiftEntryKit.display(entry: contentView, using: attributes)

        
    }
    
    private static func showCourseView(vc: UIViewController){
        let initalVC = UIHostingController(rootView: CourseView(model: CourseViewModel(user: "test")))
        initalVC.modalPresentationStyle = .fullScreen
        
        vc.present(initalVC, animated: true, completion: nil)
    }
    
    //capture image of Results circle view
    private static func determineImage(passed: Bool) -> UIImage {
        if passed {
            return UIImage(systemName: "checkmark")!
        }
        
        return UIImage(systemName: "xmark")!
    }
    
    static func dismissPopUp() {
            SwiftEntryKit.dismiss()
    }
}
