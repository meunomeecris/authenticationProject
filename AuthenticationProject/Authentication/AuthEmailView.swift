//
//  AuthEmailView.swift
//  AuthenticationProject
//
//  Created by Cris Messias on 28/01/24.
//

import SwiftUI


struct AuthEmailView: View {
    @ObservedObject var viewModel: AuthEmailViewModel

    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.3))


            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.3))

            Button(action: {
                viewModel.signIn()
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
    AuthEmailView(viewModel: AuthEmailViewModel())
}
