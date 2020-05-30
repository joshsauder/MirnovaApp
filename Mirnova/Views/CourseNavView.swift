//
//  NavigationView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/29/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct CourseNavView: View {
    @State var viewToShow: String
    
    var body: some View {
        NavigationView {
            if(viewToShow == "CourseList"){
                CourseView()
            }else if (viewToShow == "CourseMaterial"){
                CourseMaterialView(name: "")
            }
        }
    }
}

struct CourseNavView_Previews: PreviewProvider {
    static var previews: some View {
        CourseNavView(viewToShow: "CourseList")
    }
}
