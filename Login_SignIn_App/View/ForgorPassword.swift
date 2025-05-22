//
//  ForgerPassword.swift
//  Login_SignIn_App
//
//  Created by Nguyễn Quang Anh on 22/5/25.
//

import SwiftUI

struct ForgerPassword: View {
    @Binding var showSignup: Bool
    // Thuộc tính của LoginView
    @State private var emailID: String = ""
    // Thuộc tính Enviroment
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack (alignment: .leading, spacing: 15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("Quên mật khẩu?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            Text("Vui lòng điền email của bạn để chúng tôi gửi đường link khôi phục mật khẩu")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top,-5)
            
            VStack(spacing: 25) {
                // View textField người dùng
                CustomTF(sfIcon: "at", hint: "Email", value: $emailID)
                
                /// Đăng nhập
                GradientButton(title: "Gửi link", icon: "arrow.right") {
                    dismiss()
                }
                //.hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty)
                
            }
            .padding(.top, 20)

        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
    }
}

#Preview {
    ContentView()
}
