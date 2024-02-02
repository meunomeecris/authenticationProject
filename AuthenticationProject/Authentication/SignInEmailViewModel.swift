//
//  SignInEmailViewModel.swift
//  AuthenticationProject
//
//  Created by Cris Messias on 28/01/24.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    func signUp() async throws {
        guard !email.isEmpty && !password.isEmpty  else {
            print("No email or password provided.")
            return
        }
        try await AuthManager.sharedInstance.createUser(email: email, password: password)
    }

    func signIn() async throws {
        guard !email.isEmpty && !password.isEmpty  else {
            print("No email or password provided.")
            return
        }
        try await AuthManager.sharedInstance.signInUser(email: email, password: password)
    }
}
