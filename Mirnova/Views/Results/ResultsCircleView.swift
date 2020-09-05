//
//  ResultsCircleView.swift
//  Mirnova
//
//  Created by Josh Sauder on 9/4/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct ResultsCircleView: View {
    var correct: Int
    var total: Int
    
    var cicleBorderWidth = CGFloat(10)
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.green, lineWidth: cicleBorderWidth)
                .opacity(0.3)
            Circle()
                .trim(from: 0, to: finalScore())
                .stroke(style: StrokeStyle(lineWidth: cicleBorderWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(.green)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.2))
        }
        .padding(cicleBorderWidth)
        
    }
    
    /**
     Calculates the users final score
     
     - returns: The users final score
     */
    func finalScore() -> CGFloat {
        return CGFloat(correct) / CGFloat(total)
    }
}

struct ResultsCircleView_Previews: PreviewProvider {
    static var correct = 2
    static var total = 4
    
    static var previews: some View {
        ResultsCircleView(correct: correct, total: total)
    }
}
