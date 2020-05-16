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
        ZStack{
            VStack {
                HStack{
                    Text("Heres What You’ll Need to Know").font(.system(size: 24))
                    Spacer()
                }.padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))
                
                List(courseMaterial.courseMaterial){ material in
                    CourseMaterialListItem(data: material)
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)).background(Color.green)
                
            }
            HStack{
                Group{
                    Button("Practice", action: courseMaterial.handleClick)
                        .frame(width: 70, height: 40)
                        .foregroundColor(.white)
                    Divider()
                    .frame(width: 1)
                        .background(Color.white)
                    Button("Test", action: courseMaterial.handleClick)
                    .frame(width: 70, height: 40)
                    .foregroundColor(.white)
                    
                }
            }.zIndex(2)
                .frame(width: 170, height: 40)
                .background(Color.green)
                .cornerRadius(20)
                .position(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height - 70)
                
        }
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
        CourseMaterialView()
    }
}
