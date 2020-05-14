//
//  CourseView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/13/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct CourseView: View {
    let contentData: [CourseData] = [CourseData(id: UUID(uuidString: UUID().uuidString)!, name: "test")]
    
    var body: some View {
        List(contentData) { data in
            CourseCell(data: data.name)
        }
    }
}

struct CourseCell: View {
    var data: String
    
    var body: some View {
        HStack{
            Text(data)
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
