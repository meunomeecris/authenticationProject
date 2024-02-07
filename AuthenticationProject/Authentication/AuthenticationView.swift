//
//  ContentView.swift
//  AuthenticationProject
//
//  Created by Cris Messias on 28/01/24.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var showSignInView: Bool

    var body: some View {
        NavigationLink {
            SignInEmailView(viewModel: SignInEmailViewModel(), showSignInView: $showSignInView)
        } label: {
            Text("Connect with Email")
                .foregroundStyle(.white)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .font(.body)
                .bold()
                .padding()
                .background(.indigo)
        }
        .padding()
        .navigationTitle("Sign In")
    }
}

#Preview {
    AuthenticationView(showSignInView: .constant(false))
}
