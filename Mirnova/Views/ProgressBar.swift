//
//  ProgressBar.swift
//  Mirnova
//
//  Created by Josh Sauder on 8/18/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var completed: Int
    @Binding var total: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .opacity(0.1)
                Rectangle()
                    .frame(minWidth: 0, idealWidth: self.getProgressBarWidth(geometry: geometry),
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
    
    /**
     Updates the progress bars width. Note, completed is needed in order for the progess bar to be updated each time a new question is completed.
     - parameters:
        - geometry: The shapes size and coordinate space
        - completed: Number of questions completed
     */
    func getProgressBarWidth(geometry:GeometryProxy) -> CGFloat {
        //print(completed)
        let frame = geometry.frame(in: .global)
        return frame.size.width * (CGFloat(completed) / CGFloat(total))
    }
}


