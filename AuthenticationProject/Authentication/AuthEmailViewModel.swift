//
//  AuthEmailViewModel.swift
//  AuthenticationProject
//
//  Created by Cris Messias on 28/01/24.
//

import SwiftUI

@MainActor
final class AuthEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    func signIn() {
        guard !email.isEmpty && !password.isEmpty  else {
            print("No email or password provided.")
            return
        }
        
        Task {
            do {
                let returnUserDataInfos = try await AuthManager.sharedInstance.createUser(email: email, password: password)
                print("Success! \(returnUserDataInfos)")
            } catch {
                print("Error\(error)")
            }
        }
    }
}
