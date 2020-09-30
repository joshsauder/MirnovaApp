//
//  SingleButton.swift
//  Mirnova
//
//  Created by Josh Sauder on 9/29/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct SingleButton: View {
    var destinationFirst: AnyView?
    var titleFirst: String
    
    var body: some View {
        HStack {
            NavigationLink(
                destination: self.destinationFirst!){
                    Text(titleFirst)
                        .foregroundColor(.white)
                }
        }
        .zIndex(2)
        .frame(width: 170, height: 40)
        .background(Colors.DARK_GREEN)
        .cornerRadius(20)
        //need to figure out safe area
        .position(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height - 170)
        .padding(.bottom, 60)
    }
}

struct SingleButton_Previews: PreviewProvider {
    static var previews: some View {
        SingleButton(destinationFirst: nil, titleFirst: "test")
    }
}
