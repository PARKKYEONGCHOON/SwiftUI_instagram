//
//  UploadPostView.swift
//  instaClone
//
//  Created by 박경춘 on 2023/02/18.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack{
            if postImage == nil{
                Button(action: { imagePickerPresented.toggle()}, label: {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180,height: 180)
                        .clipped()
                        .padding(.top,56)
                        .foregroundColor(.black)
                        
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
            }
            else if let image = postImage {
                HStack(alignment: .top){
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96,height: 96)
                        .clipped()
                    
                    //TextField("Enter your caption...", text: $captionText).padding(.bottom)
                    TextArea(text: $captionText, placeholder: "Enter your caption..")
                        .frame(height: 200)
                    
                }.padding()
                
                HStack(spacing: 16) {
                    Button(action:{
                        captionText = ""
                        postImage = nil
                    }, label: {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                })
                    
                    Button(action:{
                        if let image = selectedImage{
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                captionText = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                        
                    }, label: {
                        Text("Share")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    })
                }.padding()
                
                
            }
            
            
            Spacer()
        }
        
    }
}

extension UploadPostView {
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

/*struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}*/
