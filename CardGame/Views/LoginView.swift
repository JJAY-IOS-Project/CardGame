//
//  LoginView.swift
//  CardGame
//
//  Created by SangWon Park on 11/24/21.
//

import SwiftUI
import Parse

struct Message {
    var alertTitle: String = ""
    var alertText: String = ""
}

struct LoginView: View {
    
    @State var username = ""
    @State var password = ""
    @State var isShowNext = false
    
    var body: some View {
        NavigationView {
            VStack {

                Image("Logo")
                    .frame(width: 60, height: 60 )
                Text("CardGame")
                    .font(.system(size: 64, weight: .semibold))
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
                
                TextField("Username", text: $username)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .background(Color.blue)
                    .frame(height: 60)
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                TextField("Password", text: $password)
                    .padding()
                    .frame(height: 60)
                    .textFieldStyle(.roundedBorder)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                NavigationLink("", destination: TabBarView(), isActive: $isShowNext)
                Button(action: {
                    let user = PFUser()
                    user.username = username
                    user.password = password
                    user.signUpInBackground { (success, error) in
                        if success {
                            self.isShowNext.toggle()
                        } else {
                            print("Error: \(error?.localizedDescription)")
                        }
                    }
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                Button(action: {
                    PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
                        if user != nil {
                            self.isShowNext.toggle()
                            
                        } else {
                            print("Error: \(error?.localizedDescription)")
                        }
                    }
                }) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }.padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//extension LoginView {
//    func goToHome() -> AnyView {
//        return GameView()
//    }
//}


//mutation logInUser($username: String!, $password: String!) {
  //  logIn(username: $username, password: $password) {
   //     sessionToken
   // }
//}
