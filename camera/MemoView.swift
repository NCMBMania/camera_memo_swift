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
                let fileName = "\(UUID()).jpg"
                let file = NCMBFile(fileName: fileName)
                var acl = NCMBACL.empty
                let user = NCMBUser.currentUser
                acl.put(key: user!.objectId!, readable: true, writable: true)
                file.acl = acl
                file.saveInBackground(data: self.imageData, callback: { result in
                    switch result {
                    case .success:
                        let memo = NCMBObject(className: "Memo");
                        memo["text"] = text
                        memo["fileName"] = fileName
                        memo.acl = acl
                        memo.saveInBackground(callback: {_ in
                            self.uploaded.toggle()
                            self.text = ""
                            DispatchQueue.main.async {
                                UIApplication.shared.closeKeyboard()
                            }
                        })
                    case let .failure(error):
                        print("保存に失敗しました: \(error)")
                        return;
                    }
                })
                print("Upload")
            }, label: {
                Text("Upload")
            })
            .alert(isPresented: $uploaded, content: {
                Alert(title: Text("アップロード完了"), message: Text("写真をアップロードしました"), dismissButton: .default(Text("閉じる"))
                )
            })
            
        }
    }
}

