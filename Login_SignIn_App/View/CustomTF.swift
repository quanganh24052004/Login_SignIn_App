import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    /// Ẩn TextField
    var isPassword: Bool = false
    @Binding var value: String
    /// Thuộc tính View
    @State private var showPassword : Bool = false
    var body: some View {
        HStack(alignment: .top, spacing: 8, content: {
            Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
                /// Căn chỉnh chiều rộng đồng đều
                .frame(width: 30)
                ///
                .offset(y: 2)
            VStack(alignment: .leading, spacing: 8, content: {
                if isPassword {
                    Group {
                        if showPassword {
                            TextField(hint, text: $value)
                        } else {
                            SecureField(hint, text: $value)
                        }
                    }
                } else {
                    TextField(hint, text: $value)
                }
                
                Divider()
            })
            .overlay(alignment: .trailing) {
                if isPassword {
                    Button(action: {
                        showPassword.toggle()
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                            .padding(10)
                            .contentShape(.rect)
                    })
                }
            }
        })
    }
}

