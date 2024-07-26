import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var navigateToDashboard = false

    var body: some View {
        NavigationView {
            VStack {
                            
                           AnimatedTextField(text: $username, placeholder: "Username")
                           AnimatedTextField(text: $password, placeholder: "Password", isSecure: true)

                           Button(action: loginUser) {
                               Text("Login")
                                   .frame(maxWidth: .infinity, minHeight: 44)
                                   .background(Color.blue)
                                   .foregroundColor(.white)
                                   .cornerRadius(8)
                           }
                           .disabled(username.isEmpty || password.isEmpty)
                           .padding()

                           if let errorMessage = errorMessage {
                               Text(errorMessage)
                                   .foregroundColor(.red)
                                   .padding()
                           }
                           
                           NavigationLink(destination: DashboardView(), isActive: $navigateToDashboard) {
                               EmptyView()
                           }
                       
            } .frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(LinearGradient(colors: [.orange  , .white , .green], startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea(.all)
            
        }
    }

    private func loginUser() {
        // Replace with actual login validation
        if let savedPassword = UserDefaults.standard.string(forKey: username), savedPassword == password {
            Persistence.saveUserProfile(UserProfile(username: username, email: "\(username)@gmail.com"))
            isLoggedIn = true
            navigateToDashboard = true
        } else {
            errorMessage = "Invalid username or password."
        }
    }
}
