//
//  ResetPasswordView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/21.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String
    
    init(email: Binding<String>){
        self._email = email
    }
    
    var body: some View {
        ZStack{
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
                    
                    
                }
                
                //forgot password
                HStack{
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13,weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.top)
                            .padding(.trailing, 30)
                    })
                    
                }
                
                //sign in
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                    
                }, label: {
                    Text("Reset Password")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(.systemCyan))
                        .cornerRadius(25)
                        .padding()
                })
                
                Spacer()
                //go to sign up
                Button(action: {mode.wrappedValue.dismiss() }, label: {
                    HStack{
                        Text("Already an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                        
                    }.foregroundColor(.white)
                })
                
                
            }
            .padding(.top)
        }
        .onReceive(viewModel.$didSendResetPasswordLink, perform: { _ in
            self.mode.wrappedValue.dismiss()
        })
    }
}

