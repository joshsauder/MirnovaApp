//
//  PracticeView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
         ZStack{
            VStack(alignment: .center) {
                HStack(){
                    Text("Practice").font(.system(size: 24))
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/7)
                Text("Question").frame(width: UIScreen.main.bounds.width, height: 3 * UIScreen.main.bounds.height/7)
                Divider()
                
                Text("Answer").frame(width: UIScreen.main.bounds.width, height: 3 * UIScreen.main.bounds.height/7)
            }
            
            DualButton(clickFirst: {print("test")}, clickSecond: {print("test")}, titleFirst: "Home", titleSeciond: "Test").body
        }
            
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
