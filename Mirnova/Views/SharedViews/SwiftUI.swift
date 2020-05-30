//
//  SwiftUI.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI


struct DualButton: View {
    var destinationFirst: AnyView
    var destinationSecond: AnyView
    var titleFirst: String
    var titleSecond: String
    
    init(destinationFirst: AnyView, destinationSecond: AnyView, titleFirst: String, titleSecond: String) {
        self.destinationFirst = destinationFirst
        self.destinationSecond = destinationSecond
        self.titleFirst = titleFirst
        self.titleSecond = titleSecond
    }
    
    var body: some View {
        HStack{
            Group{
                NavigationLink(destination: destinationFirst){
                    Text(titleFirst)
                        .foregroundColor(.white)
                }
                .frame(width: 70, height: 40)
                
                Divider()
                .frame(width: 1)
                .background(Color.white)
                
                NavigationLink(destination: destinationSecond){
                    Text(titleSecond)
                        .foregroundColor(.white)
                }
                .frame(width: 70, height: 40)
            }
        }.zIndex(2)
            .frame(width: 170, height: 40)
            .background(Color.green)
            .cornerRadius(20)
            .position(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height - 160)
    }
}
