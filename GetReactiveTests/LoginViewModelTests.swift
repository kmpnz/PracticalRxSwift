//
//  LoginViewModelTests.swift
//  GetReactiveTests
//
//  Created by Andreas Kompanez on 25.01.21.
//

import XCTest
@testable import GetReactive

class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testThatEmptyCredentialsDisallowLogin() throws {
        viewModel.username = ""
        viewModel.password = ""
        XCTAssertFalse(viewModel.isLoginAllowed)
    }

    func testThatSetCredentialsAllowLogin() throws {
        viewModel.username = "user"
        viewModel.password = "pass"
        XCTAssertTrue(viewModel.isLoginAllowed)
    }
}
