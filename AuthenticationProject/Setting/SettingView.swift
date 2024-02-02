//
//  SettingView.swift
//  AuthenticationProject
//
//  Created by Cris Messias on 28/01/24.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel: SettingViewModel
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    Task {
                        do {
                            try viewModel.signOut()
                            showSignInView = true
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Log out")
                }
                .navigationTitle("Setting")
            }
        }
    }
}

#Preview {
    SettingView(viewModel: SettingViewModel(), showSignInView: .constant(false))
}
