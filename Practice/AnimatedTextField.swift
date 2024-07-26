import SwiftUI

struct AnimatedTextField: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool = false
    @State private var isEditing: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty && !isEditing {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .offset(y: isEditing ? -20 : 0)
                    .scaleEffect(isEditing ? 0.8 : 1.0, anchor: .leading)
                    .animation(.easeInOut(duration: 0.2), value: isEditing)
            }
            
            if isSecure {
                SecureField("\(placeholder)", text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: .gray, radius: 2)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .onAppear {
                        self.isEditing = false
                    }
            } else {
                TextField("\(placeholder)", text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: .gray, radius: 2)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .onAppear {
                        self.isEditing = false
                    }
            }
        }
        .padding([.leading, .trailing], 10)
    }
}
