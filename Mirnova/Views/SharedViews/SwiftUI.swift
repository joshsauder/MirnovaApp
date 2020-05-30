//
//  SwiftUI.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct DualButton {
    var clickFirst: () -> ()
    var clickSecond: () -> ()
    
    var titleFirst: String
    var titleSeciond: String
    
    var body: some View {
        HStack{
            Group{
                Button(titleFirst, action: clickFirst)
                    .frame(width: 70, height: 40)
                    .foregroundColor(.white)
                Divider()
                .frame(width: 1)
                    .background(Color.white)
                Button(titleSeciond, action: clickSecond)
                .frame(width: 70, height: 40)
                .foregroundColor(.white)
                
            }
        }.zIndex(2)
            .frame(width: 170, height: 40)
            .background(Color.green)
            .cornerRadius(20)
            .position(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height - 160)
    }
}
