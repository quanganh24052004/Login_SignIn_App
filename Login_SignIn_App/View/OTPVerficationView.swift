import SwiftUI

struct OTPVerificationView: View {
    @Binding var otpText: String
    @State private var otpFields: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedIndex: Int?
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 12) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $otpFields[index])
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .frame(width: 45, height: 55)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .focused($focusedIndex, equals: index)
                        .onChange(of: otpFields[index]) {
                            let newValue = otpFields[index]
                            if newValue.count > 1 {
                                otpFields[index] = String(newValue.prefix(1))
                            }
                            if !newValue.isEmpty && index < 5 {
                                focusedIndex = index + 1
                            }
                            // Cập nhật otpText từ các ô
                            otpText = otpFields.joined()
                        }
                }
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
        .onAppear {
            focusedIndex = 0
        }
    }
}

#Preview {
    OTPVerificationView(otpText: .constant(""))
}
