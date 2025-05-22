import SwiftUI

struct PasswordResetView: View {
    // Thuộc tính của LoginView
    @State private var password: String = ""
    @State private var comfirmPassword: String = ""

    // Thuộc tính Enviroment
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack (alignment: .leading, spacing: 15, content: {
            Button(action: {
                    dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("Đặt lại mật khẩu")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            VStack(spacing: 25) {
                // View textField người dùng
                CustomTF(sfIcon: "lock", hint: "Mật khẩu", value: $password)
                    .padding(.top, 5)
                CustomTF(sfIcon: "lock", hint: "Nhập lại mật khẩu", value: $comfirmPassword)
                
                /// Đăng nhập
                GradientButton(title: "Gửi link", icon: "arrow.right") {
                    //Code
                    //Reset Password
                }
                //.hSpacing(.trailing)
                .disableWithOpacity(password.isEmpty || comfirmPassword.isEmpty)
                
            }
            .padding(.top, 20)

        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
    }
}

#Preview {
    PasswordResetView()
}
