//
//  LoginView.swift
//  camera
//
//  Created by Atsushi on 2021/06/23.
//

import SwiftUI
import NCMB

struct LoginView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    @Binding var isLogin: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("ユーザ名", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 280)
            SecureField("パスワード", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 280)
            Button(action: {
                signUpOrLogin()
            }, label: {
                Text("新規登録/ログイン")
            })
        }
    }
    
    // NCMBへのユーザ登録とログイン処理を行う関数
    func signUpOrLogin() {
    }
}
