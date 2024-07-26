import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            AnimatedTextField(text: $username, placeholder: "Username")
                     AnimatedTextField(text: $password, placeholder: "Password", isSecure: true)
                     AnimatedTextField(text: $confirmPassword, placeholder: "Confirm Password", isSecure: true)

                     Button(action: registerUser) {
                         Text("Register")
                             .frame(maxWidth: .infinity, minHeight: 44)
                             .background(Color.blue)
                             .foregroundColor(.white)
                             .cornerRadius(8)
                     }
                     .disabled(isRegisterButtonDisabled)
                     .padding()

                     if let errorMessage = errorMessage {
                         Text(errorMessage)
                             .foregroundColor(.red)
                             .padding()
                     }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(LinearGradient(colors:  [.orange  , .white , .green], startPoint: .topLeading, endPoint: .bottomTrailing))
            .ignoresSafeArea(.all)
    }

    private var isRegisterButtonDisabled: Bool {
        username.isEmpty || password.isEmpty || confirmPassword.isEmpty || password != confirmPassword || password.count < 6
    }

    private func registerUser() {
        if UserDefaults.standard.string(forKey: username) != nil {
            errorMessage = "User already exists."
            return
        }
        UserDefaults.standard.set(password, forKey: username)
        errorMessage = "Registration successful!"
    }
}
