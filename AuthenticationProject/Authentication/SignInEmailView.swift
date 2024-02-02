//
//  AuthEmailView.swift
//  AuthenticationProject
//
//  Created by Cris Messias on 28/01/24.
//

import SwiftUI


struct SignInEmailView: View {
    @ObservedObject var viewModel: SignInEmailViewModel
    @Binding var showSignInView: Bool

    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.3))

            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.3))

            Button(action: {
                Task {
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }

                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                }

            }, label: {
                Text("Sign In")
                    .foregroundStyle(.white)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .font(.body)
                    .bold()
                    .padding()
                    .background(.indigo)
            })
        }
        .navigationTitle("Sign in with Email")
        .padding()
    }
}

#Preview {
    SignInEmailView(viewModel: SignInEmailViewModel(), showSignInView: .constant(false))
}
