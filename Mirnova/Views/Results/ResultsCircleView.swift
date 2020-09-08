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
    var passed: Bool

    var cicleBorderWidth = CGFloat(12)
    
    init(correct: Int, total: Int){
        self.correct = correct
        self.total = total
        self.passed = CGFloat(correct) / CGFloat(total) > 0.7
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(colorScheme(), lineWidth: cicleBorderWidth)
                .opacity(0.3)
            Circle()
                .trim(from: 0, to: finalScore())
                .stroke(style: StrokeStyle(lineWidth: cicleBorderWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(colorScheme())
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.2))
            Image(systemName: resultImage())
                .font(.system(size: 100))
                .foregroundColor(colorScheme())
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
    
    /**
     Determines the system icon to use for the results image
     - returns: The system icon string
     */
    func resultImage() -> String {
        let image =  passed ? "checkmark" : "xmark"
        return image
    }
    
    /**
     Determines the color scheme for the circle view
     - returns: The views color scheme
     */
    func colorScheme() -> Color {
        let color =  passed ? Color.green : Color.red
        return color
    }
}

struct ResultsCircleView_Previews: PreviewProvider {
    static var correct = 3
    static var total = 4
    
    static var previews: some View {
        ResultsCircleView(correct: correct, total: total)
    }
}
