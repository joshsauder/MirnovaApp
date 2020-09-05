//
//  ResultsCircleView.swift
//  Mirnova
//
//  Created by Josh Sauder on 9/4/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct ResultsCircleView: View {
    var body: some View {
        Circle()
            .stroke(Color.green, lineWidth: 8)
            .padding(8)
        
    }
}

struct ResultsCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsCircleView()
    }
}
