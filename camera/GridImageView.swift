//
//  GridImageView.swift
//  camera
//
//  Created by Atsushi on 2021/06/23.
//

import SwiftUI
import NCMB

struct GridImageView: View {
    // ファイルストアからダウンロードした写真データが入る
    @State private var imageData: Data? = .init(capacity:0)
    // Memoクラスのインスタンス
    @State var memo: NCMBObject? = nil
    // モーダル表示の制御用
    @State private var isShowing = false
    
    var body: some View {
        GeometryReader { geometry in
            if imageData?.count ?? 0 > 0 {
                Image(uiImage: UIImage(data: imageData!)!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .clipped()
            } else {
                Rectangle().fill(Color.clear)
            }
        }.onAppear() {
            loadImage()
        }.onTapGesture {
            // タップしたらフラグを立てる
            isShowing = true
        // フラグが立つと、この処理に流れる
        }.fullScreenCover(isPresented: $isShowing) {
            // モーダルビューの呼び出し
            ModalView(isActive: $isShowing, memo: memo!, imageData: imageData!)
        }
        
    }
    
    // ファイルストアから写真をダウンロードする処理
    func loadImage() {
    }
}

struct GridImageView_Previews: PreviewProvider {
    static var previews: some View {
        GridImageView()
    }
}
