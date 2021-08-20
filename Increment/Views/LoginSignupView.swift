// LoginSignupView.swift, created on 18/08/21 by jair
	

import SwiftUI

struct LoginSignupView: View {
    
    @ObservedObject var viewModel: LoginSignupViewModel
    
    var emailTextField: some View {
        TextField("Email", text: $viewModel.emailText)
            .modifier(TextFieldCustomRoundedStyle())
    }
    
    var passwordTextField: some View {
        SecureField("Password", text: $viewModel.passwordText)
            .modifier(TextFieldCustomRoundedStyle())
    }
    
    var actionButton: some View {
        Button(viewModel.buttonTitle) {
            viewModel.tappedActionButton()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(Color(.systemPink))
        .cornerRadius(16)
        .padding()
    }
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(viewModel.subtitle)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(.systemGray2))
            Spacer()
                .frame(height: 50)
            emailTextField
            passwordTextField
            actionButton
            Spacer()
        }
        .padding()
    }
}

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginSignupView(viewModel: .init(mode: .login,
                                             isPushed: .constant(false)))
        }.environment(\.colorScheme, .dark)
    }
}
