//
//  RootView.swift
//  AuthenticationProject
//
//  Created by Cris Messias on 28/01/24.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView: Bool = false

    var body: some View {
        ZStack {
            NavigationStack {
                SettingView(viewModel: SettingViewModel(), showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthManager.sharedInstance.getAuthenticatedUser()
            showSignInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                AuthenticationView()
            }
        })

    }
}

#Preview {
    RootView()
}
