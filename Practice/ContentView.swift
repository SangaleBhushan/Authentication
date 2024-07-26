import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                if isLoggedIn {
                    DashboardView()
                } else {
                    VStack {
                        NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn)) {
                            Text("Login")
                        }.frame(minWidth: 90,minHeight: 30)
                            .foregroundColor(.white)
                            .font(.title2).padding()
                            .background(.pink)
                            .cornerRadius(20)
                        Divider().frame(height: 100)
                        
                        NavigationLink(destination: RegisterView()) {
                            Text("Register").frame(minWidth: 90,minHeight: 30)
                                .foregroundColor(.white)
                                .font(.title2).padding()
                                .background(.pink)
                                .cornerRadius(20)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(LinearGradient(colors:  [.orange  , .white , .green], startPoint: .topLeading, endPoint: .bottomTrailing))
            .ignoresSafeArea(.all)
            
        }
    }
}
#Preview {
    ContentView()
}
