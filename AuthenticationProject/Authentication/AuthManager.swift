//
//  AuthManager.swift
//  AuthenticationProject
//
//  Created by Cris Messias on 28/01/24.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    static let sharedInstance = AuthManager()

    private init() {}

    func createUser(email: String, password: String) async throws -> AuthModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthModel(user: authDataResult.user)
    }

    func getAuthenticatedUser() throws -> AuthModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthModel(user: user)
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
}
