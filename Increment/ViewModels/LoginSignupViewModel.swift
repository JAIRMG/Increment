// LoginSignupViewModel.swift, created on 18/08/21 by jair
	

import Foundation

final class LoginSignupViewModel: ObservableObject {
    
    private let mode: Mode
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var isValid = false
    
    var title: String {
        switch mode {
        case .login: return "Welcome back"
        case .signup: return "Create an account"
        }
    }
    
    var subtitle: String {
        switch mode {
        case .login: return "Login with your email"
        case .signup: return "sign up via email"
        }
    }
    
    var buttonTitle: String {
        switch mode {
        case .login: return "Login"
        case .signup: return "sign up"
        }
    }
    
    init(mode: Mode) {
        self.mode = mode
    }
}

extension LoginSignupViewModel {
    enum Mode {
        case login
        case signup
    }
}
