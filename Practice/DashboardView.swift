import SwiftUI

struct DashboardView: View {
    @State private var userProfile: UserProfile?

    var body: some View {
        VStack {
            if let profile = userProfile {
                Text("Welcome, \(profile.username)!")
                    .font(.largeTitle)
                Text("Email: \(profile.email)")
                    .font(.subheadline)
            } else {
                Text("Loading user profile...")
            }
        }
        .onAppear(perform: loadProfile)
    }

    private func loadProfile() {
        userProfile = Persistence.loadUserProfile()
    }
}
