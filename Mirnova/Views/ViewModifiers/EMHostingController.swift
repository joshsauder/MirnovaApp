//
//  EMHostingController.swift
//  Mirnova
//
//  Created by Josh Sauder on 10/6/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import SwiftUI


class EMHostingController<Content> : UIHostingController<Content> where Content : View {
   func fixedSafeAreaInsets() {
       guard let _class = view?.classForCoder else { return }
       
       let safeAreaInsets: @convention(block) (AnyObject) -> UIEdgeInsets = { (sself : AnyObject!) -> UIEdgeInsets in
           return .zero
       }
       
       guard let method = class_getInstanceMethod(_class.self, #selector(getter: UIView.safeAreaInsets)) else { return }
       class_replaceMethod(_class, #selector(getter: UIView.safeAreaInsets), imp_implementationWithBlock(safeAreaInsets), method_getTypeEncoding(method))
       
       let safeAreaLayoutGuide: @convention(block) (AnyObject) ->UILayoutGuide? = { (sself: AnyObject!) -> UILayoutGuide? in
           return nil
       }
       guard let method2 = class_getInstanceMethod(_class.self, #selector(getter: UIView.safeAreaLayoutGuide)) else { return }
       class_replaceMethod(_class, #selector(getter: UIView.safeAreaLayoutGuide), imp_implementationWithBlock(safeAreaLayoutGuide), method_getTypeEncoding(method2))
   }
   
   override var prefersStatusBarHidden: Bool {
       return true
   }
}
