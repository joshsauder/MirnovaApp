//
//  NavContainerView.swift
//  Mirnova
//
//  Created by Josh Sauder on 10/7/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct NavContainerView: View {
    let screenWidth = UIScreen.main.bounds.size.width

    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(width: screenWidth, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Colors.DARK_GREEN)
                .zIndex(2)

            Wave(graphWidth: 1, amplitude: 0.25)
                .foregroundColor(Colors.DARK_GREEN)
                .zIndex(2)
                .rotationEffect(.degrees(180))
        }
        .frame(width: screenWidth, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct NavContainerView_Previews: PreviewProvider {
    static var previews: some View {
        NavContainerView()
    }
}
