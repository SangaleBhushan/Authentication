import Foundation

class Persistence {
    static func saveUserProfile(_ profile: UserProfile) {
        let defaults = UserDefaults.standard
        defaults.set(profile.username, forKey: "username")
        defaults.set(profile.email, forKey: "email")
    }
    
    static func loadUserProfile() -> UserProfile? {
        let defaults = UserDefaults.standard
        guard
            let username = defaults.string(forKey: "username"),
            let email = defaults.string(forKey: "email")
        else {
            return nil
        }
        return UserProfile(username: username, email: email)
    }
    
    static func clearUserProfile() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "username")
        defaults.removeObject(forKey: "email")
    }
}
