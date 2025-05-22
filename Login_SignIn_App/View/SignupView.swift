import SwiftUI

struct SignupView: View {
    @Binding var showSignup: Bool
    // Thuộc tính của LoginView
    @State private var emailID: String = ""
    @State private var fullName: String = ""
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    var body: some View {
        VStack (alignment: .leading, spacing: 15, content: {
            Button(action: {
                showSignup = false
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("Đăng ký")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            Text("Vui lòng đăng ký để tiếp tục")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top,-5)
            
            VStack(spacing: 25) {
                // View textField người dùng
                CustomTF(sfIcon: "at", hint: "Email", value: $emailID)
                
                CustomTF(sfIcon: "person", hint: "Họ và tên", value: $fullName)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Mật khẩu",isPassword: true, value: $password)
                    .padding(.top, 5)
                
                /// Đăng nhập
                GradientButton(title: "Tiếp tục", icon: "arrow.right") {
                    askOTP = true
                }
                .fullScreenCover(isPresented: $askOTP) {
                    OTPView(otpText: $otpText)
                }
                //.hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty || fullName.isEmpty)
                
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack {
                Text("Bạn đã có tài khoản?")
                    .foregroundStyle(.gray)
                Button("Đăng nhập") {
                    showSignup = false
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
    }
}


#Preview {
    ContentView()
}
