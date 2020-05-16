//
//  CourseMaterialView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct CourseMaterialView: View {
    
    @State var courseMaterial = CourseMaterialViewModel()
    
    var body: some View {
        VStack {
            HStack{
                Text("Heres What You’ll Need to Know").font(.system(size: 24))
                Spacer()
            }.padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))
            
            List(courseMaterial.courseMaterial){ material in
                CourseMaterialListItem(data: material)
            }
        }
    }
}

struct CourseMaterialListItem: View {
    
    var data: CourseMaterial
    
    var body: some View {
        Text(data.image)
    }
}

struct CourseMaterialView_Previews: PreviewProvider {
    static var previews: some View {
        CourseMaterialView()
    }
}
