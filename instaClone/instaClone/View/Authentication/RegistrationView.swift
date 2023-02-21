//
//  RegistrationView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/21.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email = ""
    @State var fullname = ""
    @State var username = ""
    @State var password = ""
    @State private var selectedImage: UIImage?
    @State var image: Image?
    @State var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                ZStack{
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                    }
                    else
                    {
                        Button(action: {imagePickerPresented.toggle()}, label: {
                            Image("plus_photo")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.white)
                        }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                            ImagePicker(image: $selectedImage)
                            
                        })
                    }
                }
                
                VStack(spacing: 20) {
                    //email field
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    
                    CustomTextField(text: $fullname, placeholder: Text("Fullname"), imageName: "envelope")
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
                
                //sign up
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    Text("Sign Up")
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
            }.padding()
        }
            //.padding(.top)
    }
}


extension RegistrationView {
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
