// LoginSignupViewModel.swift, created on 18/08/21 by jair
	

import Combine
import SwiftUI

final class LoginSignupViewModel: ObservableObject {
    
    private let mode: Mode
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var isValid = false
    @Binding var isPushed: Bool
    private(set) var emailPlaceholderText = "Email"
    private(set) var passwordPlaceholderText = "Password"
    private let userService: UserServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
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
    
    init(mode: Mode,
         userService: UserServiceProtocol = UserService(),
         isPushed: Binding<Bool>) {
        self.mode = mode
        self.userService = userService
        self._isPushed = isPushed
    }
    
    func tappedActionButton() {
        switch mode {
        case .login:
            print("")
        case .signup:
            userService.linkAccount(email: emailText, password: passwordText).sink { [weak self] completion in
                switch completion {
                case let .failure(error):
                    print(error)
                case .finished:
                    self?.isPushed = false
                    print("finished")
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)

        }
    }
}

extension LoginSignupViewModel {
    enum Mode {
        case login
        case signup
    }
}
