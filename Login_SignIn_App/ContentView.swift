import SwiftUI

struct ContentView: View {
    // Thuộc tính của View
    @State private var showSignup: Bool = false
    var body: some View {
        NavigationStack {
            LoginView(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup){
                    SignupView(showSignup: $showSignup)
                }
        }
        .overlay{
            if #available(iOS 17, *){
                CircleView()
                    .animation(.smooth(duration:0.45, extraBounce: 0), value: showSignup)
            } else {
                CircleView()
                    .animation(.smooth(duration:0.3), value: showSignup)
            }
        }
    }
    // Hiệu ứng khi bấm đăng ký
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.cyan, .blue, .indigo], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
            .offset(x: showSignup ? 90 : -90 , y: -90)
            .blur(radius: 10)
            .hSpacing(showSignup ? .trailing: .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ContentView()
}
