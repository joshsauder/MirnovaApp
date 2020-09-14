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
        ZStack(alignment: .leading) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    GeometryReader { rectGeometry in
                        Rectangle()
                            .opacity(0.1)
                            .frame(height: 10)
                        Rectangle()
                            .opacity(0.5)
                            .frame(minWidth: 0, idealWidth: self.getProgressBarWidth(geometry: rectGeometry),
                                   maxWidth: self.getProgressBarWidth(geometry: rectGeometry),
                                   maxHeight: 10)
                            .opacity(0)
                            .background(Color.green)
                            .animation(.default)
                    }
                }
                .padding(.vertical, 5)
                ZStack{
                Circle()
                    .fill(Color.clear)
                    .frame(minHeight: 0, idealHeight: 20, maxHeight: 20)
                    Text(self.setEmoji())
                    .font(Font.system(size: 20))
                }
                .position(x: self.cicleLocation(geometry: geometry) + 10 , y: 10)
            }
            
        }
        .cornerRadius(10)
        .frame(height:20)
    }
    
    /**
     Updates the circles width. This function is needed as the padding is different between the circle and the progress bar
     - parameters:
        - geometry: The shapes size and coordinate space
     */
    func cicleLocation(geometry: GeometryProxy) -> CGFloat {
        let initWidth = getProgressBarWidth(geometry: geometry)
        return initWidth * ((geometry.size.width - 20) / geometry.size.width)
    }
    
    /**
     Updates the progress bars width. Note, completed is needed in order for the progess bar to be updated each time a new question is completed.
     - parameters:
        - geometry: The shapes size and coordinate space
     - returns: The with of the progress bar
     */
    func getProgressBarWidth(geometry:GeometryProxy) -> CGFloat {
        
        //print(completed)
        let frame = geometry.frame(in: .global)
        return frame.size.width * (CGFloat(completed) / CGFloat(total))
    }
    
    /**
     Sets the emoji based on the users progress
     - returns: The applicable emoji
        
     */
    func setEmoji() -> String {
        let low = "☹️"
        let gettingThere = "😬"
        let close = "🙂"
        let passed = "😁"
        
        if(CGFloat(completed) / CGFloat(total) < 0.25){
            return low
        } else if(CGFloat(completed) / CGFloat(total) >= 0.25 && CGFloat(completed) / CGFloat(total) < 0.50){
            return gettingThere
        } else if(CGFloat(completed) / CGFloat(total) >= 0.50 && CGFloat(completed) / CGFloat(total) < 0.75){
            return close
        } else {
            return passed
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    @State static var completed = 4
    @State static var total = 10
    static var previews: some View {
        ProgressBar(completed: $completed, total: $total)
    }
}
