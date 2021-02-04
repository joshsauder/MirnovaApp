//
//  TestView.swift
//  Mirnova
//
//  Created by Josh Sauder on 6/20/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

extension TestViewController {
    
    /**
     Sets up the  view items
     */
    func setupView() {
        
        setUpButtons(button: AButton)
        setUpButtons(button: BButton)
        setUpButtons(button: CButton)
        setUpButtons(button: DButton)
    }
    
    /**
     Sets up a given button
     - parameters:
        - button: The UIButton
     */
    private func setUpButtons(button: UIButton){
        //set up button attributes
        button.layer.cornerRadius = 0.03 * button.bounds.width
        button.clipsToBounds = true
        button.backgroundColor = .white
        
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        button.layer.borderWidth = 3
        
        if #available(iOS 14.0, *) {
            button.setTitleColor(UIColor(Colors.DARK_GREEN), for: .normal)
        } else {
            button.setTitleColor(Colors.GREEN, for: .normal)
        }
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        //add shadow
        button.layer.masksToBounds = false
        button.layer.shadowColor = Colors.GRAY.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowOpacity = 0.2

    }
    
    /**
     Colors the UIButton
     - parameters:
        - index: The index of the button to color
        - color: Color the button needs to be colored
        - textColor: Color of the label inside the button
     */
    func colorButtons(index: Int, color: UIColor, background: UIColor, textColor: UIColor){
        switch index {
        case 0:
            AButton.backgroundColor = background
            AButton.layer.borderColor = color.withAlphaComponent(0.4).cgColor
            AButton.setTitleColor(textColor, for: .normal)
        case 1:
            BButton.backgroundColor = background
            BButton.layer.borderColor = color.withAlphaComponent(0.4).cgColor
            BButton.setTitleColor(textColor, for: .normal)
        case 2:
            CButton.backgroundColor = background
            CButton.layer.borderColor = color.withAlphaComponent(0.4).cgColor
            CButton.setTitleColor(textColor, for: .normal)
        default:
            DButton.backgroundColor = background
            DButton.layer.borderColor = color.withAlphaComponent(0.4).cgColor
            DButton.setTitleColor(textColor, for: .normal)
        }
    }
    
    /**
     Toggles whether the buttons are enabled
     */
    func toggleEnableButtons(){
        self.AButton.isEnabled = !self.AButton.isEnabled
        self.BButton.isEnabled = !self.BButton.isEnabled
        self.CButton.isEnabled = !self.CButton.isEnabled
        self.DButton.isEnabled = !self.DButton.isEnabled
    }
    
    /**
     Adds the SignImageView SwiftUI View to the Sign Image UIView
     - parameters:
        - imageModel: The model container the currently displayed image
     */
    func initImageView(imageModel: SignImageViewModel){
        let subView = UIHostingController(rootView: SignImageView(imageModel: imageModel))
        SignImage.addSubview(subView.view)
        subView.view.translatesAutoresizingMaskIntoConstraints = false
        subView.view.topAnchor.constraint(equalTo:SignImage.topAnchor).isActive = true
        subView.view.bottomAnchor.constraint(equalTo:SignImage.bottomAnchor).isActive = true
        subView.view.leftAnchor.constraint(equalTo:SignImage.leftAnchor).isActive = true
        subView.view.rightAnchor.constraint(equalTo:SignImage.rightAnchor).isActive = true
    }
    
    /**
     Eases a button in and out.
     - parameters:
        - view: The view to animate
     */
    func easeViewInOut(view: UIView){
        UIView.animate(withDuration: 0.5,
            animations: {
                view.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.5) {
                    view.transform = CGAffineTransform.identity
                }
            })
    }
    
    func leftToRight(view: UIView){
        UIView.animate(withDuration: 0.5,
            animations: {
                view.transform = CGAffineTransform(translationX: 0, y: 300)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.5) {
                    view.transform = CGAffineTransform.identity
                }
            })
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
