import SwiftUI

struct OTPView: View {
    @Binding var otpText: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            // Nút quay lại
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            // Tiêu đề
            Text("Nhập OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            // Mô tả
            Text("Mã xác thực gồm 6 số đã được gửi đến email của bạn. Vui lòng kiểm tra hộp thư.")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            OTPVerificationView(otpText: $otpText)              .padding(.top, 10)
            
            // Nút gửi
            GradientButton(title: "Gửi mã", icon: "checkmark") {
                // Xử lý gửi mã
            }
            .disableWithOpacity(otpText.isEmpty)
            .padding(.top, 10)

            Spacer()
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
    }
}

#Preview {
    OTPView(otpText: .constant(""))
}
