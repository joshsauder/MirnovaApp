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
                    .font(Font.system(size: 40))
                    .foregroundColor(Color.green)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                ZStack {
                    VStack{
                        Spacer()
                        Button("Apple Sign in", action: signIn)
                        .padding()
                        Button("Google Sign in", action: signIn)
                        .padding()
                    }
                    .padding(.bottom, 110)
                    .zIndex(2)
                    VStack(spacing: 0) {
                        waves()
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 250)
                    }
                    .foregroundColor(Color.green)
                    .zIndex(1)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
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

extension ContentView {
    func waves() -> some View {
        ZStack {
            Wave(graphWidth: 1, amplitude: 0.20)
                .foregroundColor(Color.green)
                .zIndex(2)
            Wave(graphWidth: 1, amplitude: 0.20)
                .foregroundColor(Color.init(red: 0.82, green: 0.94, blue: 0.75))
            .offset(x: 150, y: 0)
            .zIndex(1)
        }
    }
}

struct Wave: Shape {
    let graphWidth: CGFloat
    let amplitude: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height

        let origin = CGPoint(x: 0, y: height * 0.50)

        var path = Path()
        path.move(to: origin)
        
        var endY: CGFloat = 0.0
        let step = 5.0
        for angle in stride(from: step, through: Double(width) * (step * step), by: step) {
            let x = origin.x + CGFloat(angle/360.0) * width * graphWidth
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
            endY = y
        }
        path.addLine(to: CGPoint(x: width, y: endY))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: origin.y))
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
