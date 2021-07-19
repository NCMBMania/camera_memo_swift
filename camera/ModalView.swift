//
//  ModalView.swift
//  camera
//
//  Created by Atsushi on 2021/06/23.
//

import SwiftUI
import NCMB

struct ModalView: View {
    // モーダル表示中かどうかのフラグ（一覧から受け継ぎ）
    @Binding var isActive: Bool
    // Memoクラスのインスタンス
    @State var memo: NCMBObject
    // ファイルストアからダウンロードした写真データが入る
    @State var imageData: Data
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                GeometryReader { geometry in
                    Image(uiImage: UIImage(data: imageData)!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
                // Memoクラスに入れていたメッセージを受け取る
                if let text: String = memo["text"] {
                    Text(text).padding()
                }
                Button("閉じる") {
                    isActive = false
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .background(Color(.black))
    }
}
