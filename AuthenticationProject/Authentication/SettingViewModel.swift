//
//  SettingViewModel.swift
//  AuthenticationProject
//
//  Created by Cris Messias on 28/01/24.
//

import SwiftUI

@MainActor
final class SettingViewModel: ObservableObject {
    func signOut() throws {
        try AuthManager.sharedInstance.signOut() 
    }

    func resetPassword() async throws {
        let authUser = try AuthManager.sharedInstance.getAuthenticatedUser()
        guard let email = authUser.email  else {
            throw URLError(.fileDoesNotExist)
        }

        try await AuthManager.sharedInstance.resetPassword(email: email )
    }
}
