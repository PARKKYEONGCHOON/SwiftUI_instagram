//
//  LoginView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack{
                    Image("insta_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220,height: 100)
                        .foregroundColor(.white)
                        
                    VStack(spacing: 20) {
                        //email field
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        
                        //password field
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                    
                    //forgot password
                    HStack{
                        Spacer()
                        
                        NavigationLink(destination: ResetPasswordView(email: $email),
                                       label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 30)
                        })
                        
                    }
                    
                    //sign in
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(.systemCyan))
                            .cornerRadius(25)
                            .padding()
                    })
                    
                    Spacer()
                    //go to sign up
                    NavigationLink(destination: RegistrationView().navigationBarHidden(true), label: {
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                            
                        }.foregroundColor(.white)
                    }).padding(.bottom, 16)
                    
                    
                }
                .padding(.top)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
