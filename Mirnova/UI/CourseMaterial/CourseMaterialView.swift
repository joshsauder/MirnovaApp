//
//  CourseMaterialView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/16/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct CourseMaterialView: View {
    @ObservedObject var courseMaterial: CourseMaterialViewModel
    
    init(name: String) {
        self.courseMaterial = CourseMaterialViewModel(name: name)
    }
    
    var body: some View {
        ZStack{
            List{
                ForEach(Array(courseMaterial.courseMaterial.enumerated()), id: \.1.id){(index, material) in
                CourseMaterialListItem(data: material, image: self.courseMaterial.images[index])
                }
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)).background(Color.green)
                .zIndex(1)
            
            if courseMaterial.images.count > 0 {
                DualButton(destinationFirst: AnyView(PracticeView(model: courseMaterial.courseMaterial, images: courseMaterial.images)),
                           destinationSecond: AnyView(PracticeView(model: courseMaterial.courseMaterial, images: courseMaterial.images)),
                           funcFirst: nil,
                           funcSecond: nil,
                           titleFirst: "Practice",
                           titleSecond: "Test")
            }
            
        }
        .navigationBarTitle(Text("Course Material"))
        .onAppear(perform: courseMaterial.load)
        
    }
}


struct CourseMaterialListItem: View {
    
    var data: CourseMaterial
    var image: UIImage
    
    var body: some View {
        HStack{
            Image(uiImage: image)
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(35)
            Spacer()
            Text(data.answer)
        }
    }
}


struct CourseMaterialListItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseMaterialListItem(data: CourseMaterial(id: UUID(), image: "A.jpg", question: "test", answer: "test"), image: UIImage(named: "A.jpg")!)
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
