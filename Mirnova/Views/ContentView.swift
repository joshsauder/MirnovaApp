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
            VStack(){
                Text("Mirnova")
                .font(.title)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                VStack{
                    Button("Apple Sign in", action: signIn)
                    .padding()
                    Button("Google Sign in", action: signIn)
                    .padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.green)
            }
            if !showLogin {
                CourseView()
                    .transition(.slide)
            }
        }
        .edgesIgnoringSafeArea(.all)
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
