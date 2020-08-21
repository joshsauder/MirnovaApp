//
//  ProgressBar.swift
//  Mirnova
//
//  Created by Josh Sauder on 8/18/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    var value:CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .opacity(0.1)
                Rectangle()
                    .frame(minWidth: 0, idealWidth:self.getProgressBarWidth(geometry: geometry),
                           maxWidth: self.getProgressBarWidth(geometry: geometry))
                    .opacity(0.5)
                    .background(Color.green)
                    .animation(.default)
            }
            .cornerRadius(10)
            .frame(height:10)
            .padding(.horizontal, 30)
        }
    }
    
    func getProgressBarWidth(geometry:GeometryProxy) -> CGFloat {
        let frame = geometry.frame(in: .global)
        return frame.size.width * value
    }
    
    func getPercentage(_ value:CGFloat) -> String {
        let intValue = Int(ceil(value * 100))
        return "\(intValue) %"
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: 0.10)
    }
}
