//
//  UploaderView.swift
//  camera
//
//  Created by Atsushi on 2021/06/23.
//

import SwiftUI
import NCMB

struct UploaderView: View {
    @State var imageData : Data = .init(capacity:0)
    @State var source:UIImagePickerController.SourceType = .photoLibrary
    @State var isImagePicker = false
    @State var isLogin: Bool = NCMBUser.currentUser != nil
    var body: some View {
            NavigationView{
                VStack(spacing:0){
                        ZStack{
                            Color.white
                                .edgesIgnoringSafeArea(.all)
                                .opacity(0.0)
                            NavigationLink(
                                destination: Imagepicker(show: $isImagePicker, image: $imageData, sourceType: source),
                                isActive:$isImagePicker,
                                label: {
                                    Text("")
                                })
                            VStack{
                                if isLogin {
                                    VStack(spacing:30){
                                        MemoView(imageData: $imageData)
                                        HStack(spacing:60){
                                            Button(action: {
                                                self.source = .photoLibrary
                                                self.isImagePicker.toggle()
                                            }, label: {
                                                Text("フォトライブラリ")
                                            })
                                            Button(action: {
                                                self.source = .camera
                                                self.isImagePicker.toggle()
                                            }, label: {
                                                Text("写真を撮影")
                                            })
                                        }
                                        Button(action: {
                                            // ログアウト処理を実装します
                                        }, label: {
                                            Text("ログアウト")
                                        })
                                    }
                                } else {
                                    LoginView(isLogin: $isLogin)
                                }
                            }
                        }
                        .gesture(
                            TapGesture()
                                .onEnded { _ in
                                    UIApplication.shared.closeKeyboard()
                                }
                        )
                
                }
                .navigationBarTitle("Home", displayMode: .inline)
            }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.primary.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}

struct UploaderView_Previews: PreviewProvider {
    static var previews: some View {
        UploaderView()
    }
}
