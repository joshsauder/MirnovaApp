//
//  ContentView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/13/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showLogin = true
    
    var body: some View {
        ZStack {
            VStack{
                Text("Mirnova")
                .font(.title)
                
                Button("Sign in", action: signIn)
                    .padding()
            }
            if !showLogin {
                CourseView()
                    .transition(.slide)
            }
        }
    }
    
    func signIn(){
        showLogin.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
