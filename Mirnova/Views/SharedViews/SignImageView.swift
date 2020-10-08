//
//  SignImageView.swift
//  Mirnova
//
//  Created by Josh Sauder on 8/27/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI
import Combine

struct SignImageView: View {
    @ObservedObject var imageModel: SignImageViewModel

    var body: some View {
        Image(uiImage: imageModel.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .padding(.horizontal, 10)
    }
}

struct SignImageView_Previews: PreviewProvider {
    @ObservedObject static var imageModel = SignImageViewModel(image: UIImage(named: "A.jpg")!)
    static var previews: some View {
        SignImageView(imageModel: imageModel)
    }
}
