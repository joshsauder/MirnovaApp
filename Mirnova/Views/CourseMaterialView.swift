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
    
    init(courseData: CourseData) {
        self.courseMaterial = CourseMaterialViewModel(courseData: courseData)
    }
    
    var body: some View {
        ZStack{
            List{
                ForEach(Array(courseMaterial.courseMaterial.enumerated()), id: \.1.id){(index, material) in
                CourseMaterialListItem(data: material)
                }
            }.cornerRadius(radius: 10, corners: [.topLeft, .topRight])
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                .background(Colors.DARK_GREEN)
                .edgesIgnoringSafeArea(.bottom)
                .zIndex(1)
            
            if courseMaterial.courseMaterial.count > 0 {
                DualButton(destinationFirst: AnyView(PracticeView(model: courseMaterial.courseMaterial)),
                           destinationSecond: AnyView(TestUIView(courseMaterial: courseMaterial.courseMaterial, course: courseMaterial.courseData.name)),
                           funcFirst: nil,
                           funcSecond: nil,
                           titleFirst: "Practice",
                           titleSecond: "Test")
            }
            
        }        //update nav bar title
        .navigationBarTitle(Text("Course Material"))
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
                .padding(.leading, 5)
            Spacer()
            Text(data.answer)
                .padding(.trailing, 10)
        }
    }
}

struct CourseMaterialView_Preview: PreviewProvider {
    static var previews: some View {
        CourseMaterialView(courseData: CourseData(id: UUID(), name: "test", correct: 1, image: UIImage(), questions: 1, completed: true, attempts: 1, average: 1.0))
    }
}

struct CourseMaterialListItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseMaterialListItem(data: CourseMaterial(id: UUID(), imageString: "test", image: UIImage(named: "A.jpg")!, question: "test", answer: "test"))
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
