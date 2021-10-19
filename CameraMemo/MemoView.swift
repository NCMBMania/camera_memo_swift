//
//  MemoView.swift
//  camera
//
//  Created by Atsushi on 2021/06/23.
//

import SwiftUI
import NCMB


struct MemoView: View {
    @Binding var imageData : Data
    @State private var text: String = ""
    @State private var uploaded = false
    
    var body: some View {
        if imageData.count != 0 {
            Image(uiImage: UIImage(data: self.imageData)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .cornerRadius(15)
                .padding()
            TextField("メモ", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 280)
            Button(action: {
                // アップロード処理を記述します
            }, label: {
                Text("アップロード")
            })
            .alert(isPresented: $uploaded, content: {
                Alert(title: Text("アップロード完了"), message: Text("写真をアップロードしました"), dismissButton: .default(Text("閉じる"))
                )
            })
            
        }
    }
}

