import SwiftUI

struct LoginView: View {
    @Binding var showSignup: Bool
    // Thuộc tính của LoginView
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showForgotPasswordView: Bool = false
    
    @State private var showResetView: Bool = false

    var body: some View {
        VStack (alignment: .leading, spacing: 15, content: {
            Spacer(minLength: 0)
            
            Text("Đăng nhập")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Vui lòng đăng nhập để tiếp tục")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top,-5)
            
            VStack(spacing: 25) {
                // View textField người dùng
                CustomTF(sfIcon: "at", hint: "Email", value: $emailID)
                
                CustomTF(sfIcon: "lock", hint: "Mật khẩu",isPassword: true, value: $password)
                    .padding(.top, 5)
                
                Button ("Quên mật khẩu?") {
                    showForgotPasswordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                //.tint(.yellow)
                .hSpacing(.trailing)
                
                /// Đăng nhập
                GradientButton(title: "Đăng nhập", icon: "arrow.right") {
                    
                }
                //.hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)
                
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack {
                Text("Bạn chưa có tài khoản?")
                    .foregroundStyle(.gray)
                Button("Đăng ký") {
                    showSignup.toggle()
                }
                .fontWeight(.bold)
                .tint(.blue)
                
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        // Hỏi email ID để gửi link reset
        .sheet(isPresented: $showForgotPasswordView, content: {
            if #available(iOS 16.4, *) {
                ForgorPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgorPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
            }
        })
        // Đặt lại mật khẩu
        .sheet(isPresented: $showResetView, content: {
            if #available(iOS 16.4, *) {
                PasswordResetView()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                ForgorPassword(showResetView: $showResetView)
                    .presentationDetents([.height(350)])
            }
        })
    }
}

#Preview {
    ContentView()
}
