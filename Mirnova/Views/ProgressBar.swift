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
                    .frame(height: 10)
                    .padding(.horizontal, 5)
                Rectangle()
                    .frame(minWidth: 0, idealWidth: self.getProgressBarWidth(geometry: geometry),
                           maxWidth: self.getProgressBarWidth(geometry: geometry),
                           maxHeight: 10)
                    .opacity(0.5)
                    .background(Color.green)
                    .animation(.default)
                    .padding(.horizontal, 5)
                Circle()
                    .fill(Color.green)
                    .frame(minHeight: 0, idealHeight: 20, maxHeight: 20)
                    .position(x: self.getProgressBarWidth(geometry: geometry) + 10, y: 10)
            }
            .cornerRadius(10)
            .frame(height:20)
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

struct ProgressBar_Previews: PreviewProvider {
    @State static var completed = 1
    @State static var total = 10
    static var previews: some View {
        ProgressBar(completed: $completed, total: $total)
    }
}
