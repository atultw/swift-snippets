import SwiftUI
import Auth0

struct LoginView: View {
    var body: some View {
        Text("Hello 👋")
        Button("Login") {
            Auth0
                .webAuth()
                .scope("openid profile")
                .audience("youraudience.net/hi")
          //    .useEphemeralSession() // This is if you want to bypass the "__ wants to use __ to sign in" popup
                .start { result in
                    switch result {
                    case .failure(let error):
                        // You would put your error handling logic here. Consider a popup or display another view
                        print("Error: \(error)")
                    case .success(let credentials):
                        // Use the credentials, for example save
                        print("Credentials: \(credentials.idToken ?? "no token")")
                    }
                }
        }
    }
}
