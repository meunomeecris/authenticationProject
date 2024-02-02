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
}
