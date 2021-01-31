//
//  LoginViewController.swift
//  GetReactive
//
//  Created by Andreas Kompanez on 21.01.21.
//

import UIKit

// MARK: -
// MARK: Login view controller

final class LoginViewController: UIViewController {
    // MARK: -
    // MARK: UI fields

    lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        headerLabel.text = "Please login 🍇"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()

    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var confirmButton: UIButton = {
        let button = UIButton()

        button.setTitle("Login", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.setTitleColor(.systemGray, for: .disabled)
        button.isEnabled = false

        return button
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        stackView.spacing   = 16.0

        return stackView
    }()

    // MARK: -
    // MARK: ViewModel

    private var viewModel: LoginViewModelType

    // MARK: -
    // MARK: Methods start

    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        bindViewModel()
    }
}

// MARK: -
// MARK: UISetupableType extension

extension LoginViewController: UISetupableType {
    func setupUI() {
        view.backgroundColor = .systemTeal

        navigationItem.title = viewModel.navigationTitle

        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(confirmButton)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            stackView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1, constant: -100),
        ])
    }
}

// MARK: -
// MARK: Bindings

extension LoginViewController {
    func bindViewModel() {
        usernameTextField.addTarget(self, action: #selector(usernameTextFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passworldTextFieldDidChange), for: .editingChanged)
        confirmButton.addTarget(self, action: #selector(confirmButtonAction), for: .touchUpInside)

        viewModel.canLoginCallback = { [weak self] (isValid) in
            self?.confirmButton.isEnabled = isValid
        }
    }

    @objc func usernameTextFieldDidChange(textField: UITextField) {
        viewModel.username = textField.text ?? ""
    }

    @objc func passworldTextFieldDidChange(textField: UITextField){
        viewModel.password = textField.text ?? ""
    }

    @objc func confirmButtonAction(button: UIButton) {
        debugPrint([viewModel.username, viewModel.password, "Action!"])

        switch viewModel.attemptLogin() {
            case .success(let result):
                debugPrint([viewModel.username, viewModel.password, "Success: \(result)"])
            case .failure(let err):
                debugPrint(err)
        }
    }
}
