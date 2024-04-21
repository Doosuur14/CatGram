//
//  LoginViewModel.swift
//  NavigateU
//
//  Created by Faki Doosuur Doris on 16.03.2024.
//

import Foundation
import Combine

protocol LoginMainViewModelProtocol: UIKitViewModel where State == MainViewState, Intent == MainViewIntent {}

final class LoginViewModel: LoginMainViewModelProtocol {

    @Published private(set) var state: MainViewState {
        didSet {
            stateDidChange.send()
        }
    }

  //  @Published var error: String?

    private(set) var stateDidChange = ObservableObjectPublisher()

    init () {
        self.state = .loading
    }

//    func login(email: String, password: String) {
//        UserService.shared.login(email: email, password: password) { [weak self] result in
//            switch result {
//            case .success:
//                print("User successfully logged in!")
//            case .failure:
//                print("Login failed")
//                self?.error = "Invalid email and password."
//            }
//        }
//    }
    
    func trigger (_ intent:  MainViewIntent, email: String, password: String) {
        switch intent {
        case .didTapLoginButton:
            UserService.shared.login(email: email, password: password) { [weak self] result in
                switch result {
                case .success:
                    print("User successfully logged in!")
                    self?.state = .isloggedSuccessfully
                case .failure(let error):
                    self?.state = .loginFailed
                    let loginError = EnumError.loginFailed(error)
                    loginError.handleError()
                }
            }
        case .didTapRegisterButton:
            print("register tapped")
        }
    }
}
