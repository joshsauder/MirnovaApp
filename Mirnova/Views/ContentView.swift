//
//  ContentView.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/13/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import SwiftUI
import AuthenticationServices
import GoogleSignIn

struct ContentView: View {
    @State var appleLogin = true
    @EnvironmentObject var googleDelegate: GoogleDelegate
    @State var user = ""
    
    var body: some View {
        ZStack {
            VStack(){
                Image(uiImage: UIImage(named: "MirnovaLogo")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(70)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                ZStack {
                    VStack{
                        Spacer()
                        SignInWithAppleButton(.signIn,
                                              onRequest: { (request) in
                                                  request.requestedScopes = [.fullName, .email]
                                               },
                                              onCompletion: { (result) in
                                                signIn(result: result)
                                              }
                                            )
                        .signInWithAppleButtonStyle(.black)
                        .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 30)
                        Google()
                            .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 30)
                    }
                    .padding(.bottom, 110)
                    .zIndex(2)
                    VStack(spacing: 0) {
                        waves()
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 250)
                    }
                    .foregroundColor(Colors.DARK_GREEN)
                    .zIndex(1)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
            .edgesIgnoringSafeArea(.all)
            if !appleLogin || googleDelegate.signedIn {
                CourseView(user: user)
                    .transition(.slide)
            }
        }
    }
    
    func signIn(result: Result<ASAuthorization, Error>){
        switch result {
            case .success(let authorization):
                //Handle autorization
                if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                    let email = appleIDCredential.email
                    let givenName = appleIDCredential.fullName?.givenName
                    let familyName = appleIDCredential.fullName?.familyName
                    
                    Network.shared.apollo.perform(mutation: NewUserMutation(user:InputUser(
                            email: email ?? "",
                            name: "\(givenName) \(familyName)")
                    )) { result in
                        guard let data = try? result.get().data else { return }
                        user = data.createUser?.id ?? ""
                        appleLogin.toggle()
                    }
                }
                break
            case .failure(let error):
                print(error)
                //Handle error
                break
            }
    }
}

extension ContentView {
    func waves() -> some View {
        ZStack {
            Wave(graphWidth: 1, amplitude: 0.20)
                .foregroundColor(Colors.DARK_GREEN)
                .zIndex(2)
            Wave(graphWidth: 1, amplitude: 0.20)
                .foregroundColor(Colors.LIGHT_GREEN)
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

struct Google : UIViewRepresentable {
    

    func makeUIView(context: UIViewRepresentableContext<Google>) -> GIDSignInButton {
        
        let button = GIDSignInButton()
        button.colorScheme = .light
        GIDSignIn.sharedInstance()?.clientID = APIKeys.GOOGLE_KEYS
            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<Google>) {
        
    }
}

class GoogleDelegate: NSObject, GIDSignInDelegate, ObservableObject {

    @Published var signedIn: Bool = false
    @Published var userId: String = ""
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        Network.shared.apollo.perform(mutation: NewUserMutation(user:InputUser(
                email: user.profile.email,
                name: user.profile.name)
        )) {result in
            guard let data = try? result.get().data else { return }
            self.userId = data.createUser?.id ?? ""
            
            self.signedIn = true
        }
    }
}
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}


