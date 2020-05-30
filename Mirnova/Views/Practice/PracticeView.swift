//
//  PracticeView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
         ZStack{
            VStack(alignment: .center) {
                Text("Question")
                .frame(minHeight: 0, maxHeight: .infinity)
                Divider()

                Text("Answer")
                .frame(minHeight: 0, maxHeight: .infinity)
            }
            .zIndex(1)
            DualButton(destinationFirst: AnyView(CourseView()), destinationSecond: AnyView(CourseMaterialView(name: "test")), titleFirst: "Home", titleSecond: "Test")
            
        }.navigationBarTitle("Practice")
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
