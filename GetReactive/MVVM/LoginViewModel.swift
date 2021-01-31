//
//  LoginViewModel.swift
//  GetReactive
//
//  Created by Andreas Kompanez on 21.01.21.
//

import Foundation

// MARK: -
// MARK: LoginViewModelType

protocol LoginViewModelType: ViewModelType {
    var username: String { get set }

    var password: String { get set }

    var isLoginAllowed: Bool { get }

    typealias LoginCallbackType = (Bool) -> Void

    var canLoginCallback: (LoginCallbackType)? { get set }

    func attemptLogin() -> Result<Bool, LoginError>
}

// MARK: -
// MARK: LoginViewModel implementation

final class LoginViewModel: LoginViewModelType {
    let tabBarTitle = "MVVM"

    let tabBarImageName = "fruit-grapes"

    let navigationTitle = "🍊 Fruit Inc. Login"

    var canLoginCallback: ((Bool) -> Void)?

    var isLoginAllowed: Bool {
        return checkIfLoginIsAllowed()
    }

    var username = "" {
        didSet {
            evaluateLoginState()
        }
    }

    var password = "" {
        didSet {
            evaluateLoginState()
        }
    }

    func attemptLogin() -> Result<Bool, LoginError> {
        return .success(true)
    }

    // MARK: -
    // MARK: Private methods

    private func evaluateLoginState() {
        let valid = checkIfLoginIsAllowed()
        canLoginCallback?(valid)
    }

    private func checkIfLoginIsAllowed() -> Bool {
        return !username.isEmpty && !password.isEmpty
    }
}
