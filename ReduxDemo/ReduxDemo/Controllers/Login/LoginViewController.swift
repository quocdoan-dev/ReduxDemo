//
//  LoginViewController.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/24/21.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LOGIN"
        setupUI()
    }

    private func setupUI() {
        loginButton.setBackgroundColor(.darkGray, for: .normal)
        loginButton.setBackgroundColor(.gray, for: .disabled)
        loginButton.isEnabled = false
    }

    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        let vc = TopViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentText: NSString = textField.text as NSString? {
            let newText = currentText.replacingCharacters(in: range, with: string)
            switch textField {
            case userNameTextField:
                loginButton.isEnabled = !newText.isEmpty && !(passwordTextField.text?.isEmpty ?? false)
            default:
                loginButton.isEnabled = !newText.isEmpty && !(userNameTextField.text?.isEmpty ?? false)
            }
            return true
        } else {
            return false
        }
    }
}
