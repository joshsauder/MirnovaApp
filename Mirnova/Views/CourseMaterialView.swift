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
    @State private var isActive: Bool = false
    
    init(name: String) {
        self.courseMaterial = CourseMaterialViewModel(name: name)
    }
    
    var body: some View {
        ZStack{
            List{
                ForEach(Array(courseMaterial.courseMaterial.enumerated()), id: \.1.id){(index, material) in
                CourseMaterialListItem(data: material)
                }
            }.cornerRadius(radius: 10, corners: [.topLeft, .topRight])
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)).background(Color.green)
                .zIndex(1)
            
            if courseMaterial.courseMaterial.count > 0 {
                DualButton(destinationFirst: AnyView(PracticeView(model: courseMaterial.courseMaterial)),
                           destinationSecond: AnyView(TestUIView(courseMaterial: courseMaterial.courseMaterial)
                            .navigationBarTitle("Test", displayMode: .inline)),
                           funcFirst: nil,
                           funcSecond: nil,
                           titleFirst: "Practice",
                           titleSecond: "Test")
            }
            
        }
        //update nav bar title
        .navigationBarTitle(Text(isActive ? "Course Material": "Stop Test"))
        .onAppear{
            DispatchQueue.main.async {
                self.isActive = true
            }
        }
        .onDisappear {
            DispatchQueue.main.async {
                self.isActive = false
            }
        }
        .onAppear(perform: courseMaterial.load)
    }
}


struct CourseMaterialListItem: View {
    
    var data: CourseMaterial
    
    var body: some View {
        HStack{
            Image(uiImage: data.image)
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
        CourseMaterialListItem(data: CourseMaterial(id: UUID(), imageString: "test", image: UIImage(named: "A.jpg")!, question: "test", answer: "test"))
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
