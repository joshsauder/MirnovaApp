//
//  SwiftUI.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI


struct DualButton: View {
    var destinationFirst: AnyView?
    var destinationSecond: AnyView?
    var funcFirst: (() -> Void)?
    var funcSecond: (() -> Void)?
    var titleFirst: String
    var titleSecond: String
    
    init(destinationFirst: AnyView?, destinationSecond: AnyView?, funcFirst: (() -> Void)?, funcSecond: (() -> Void)?, titleFirst: String, titleSecond: String) {
        self.destinationFirst = destinationFirst
        self.destinationSecond = destinationSecond
        self.funcFirst = funcFirst
        self.funcSecond = funcSecond
        self.titleFirst = titleFirst
        self.titleSecond = titleSecond
    }
    
    var body: some View {
        HStack{
            Group{
                
                renderButton(optionalView: destinationFirst, optionalFunc: funcFirst, buttonTitle: titleFirst).body
                
                Divider()
                .frame(width: 1)
                .background(Color.white)
                
                renderButton(optionalView: destinationSecond, optionalFunc: funcSecond, buttonTitle: titleSecond).body
            }
        }.zIndex(2)
            .frame(width: 170, height: 40)
            .background(Color.green)
            .cornerRadius(20)
            .position(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height - 160)
    }
}

struct renderButton: View {
    var optionalView: AnyView?
    var optionalFunc: (() -> ())?
    var buttonTitle: String
    
    var body: some View {
        HStack {
            if self.optionalView != nil {
                NavigationLink(destination: self.optionalView!){
                    Text(self.buttonTitle)
                        .foregroundColor(.white)
                    }.frame(width: 70, height: 40)
            }else {
                Button(action: self.optionalFunc!, label: {
                    Text(self.buttonTitle)
                    .foregroundColor(.white)
                }).frame(width: 70, height: 40)
            }
        }
    }
}
