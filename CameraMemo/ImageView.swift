//
//  ImageView.swift
//  camera
//
//  Created by Atsushi on 2021/06/23.
//

import SwiftUI
import NCMB

struct ImageView: View {
    @State var memos: [NCMBObject] = []
    
    var columns: [GridItem] = Array(repeating: .init(.fixed(200)), count: 2)
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, alignment: .center, spacing: 200) {
                ForEach (memos, id: \.objectId) { memo in
                    GridImageView(memo: memo)
                }
            }
            .onAppear() {
                getAllPhotos()
            }
        }
    }
    // データストアからメモをダウンロードする関数
    func getAllPhotos() {
    }
}


struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
