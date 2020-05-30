//
//  CourseMaterialView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct CourseMaterialView: View {
    var courseMaterial: CourseMaterialViewModel
    
    init(name: String) {
        self.courseMaterial = CourseMaterialViewModel(name: name)
    }
    
    var body: some View {
        ZStack{
            List(courseMaterial.courseMaterial){ material in
                CourseMaterialListItem(data: material)
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)).background(Color.green)
                .zIndex(1)
            
            DualButton(clickFirst: courseMaterial.handleClick, clickSecond: courseMaterial.handleClick, titleFirst: "Practice", titleSeciond: "Test").body
            
        }
        .navigationBarTitle(Text("Course Material"))
        
    }
}

struct CourseMaterialListItem: View {
    
    var data: CourseMaterial
    
    var body: some View {
        HStack{
            Text(data.image)
            Spacer()
            Text(data.answer)
        }
    }
}


struct CourseMaterialView_Previews: PreviewProvider {
    static var previews: some View {
        CourseMaterialView(name: "test")
    }
}
