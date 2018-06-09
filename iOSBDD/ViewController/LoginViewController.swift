//
//  LoginViewController.swift
//  iOSBDD
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

protocol LoginView: class {
    func showError(_ error: String)
    func showNextPage()
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    private var interactor: LoginInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = LoginPresenter(view: self)
        interactor = LoginInteractor(presenter: presenter)
        userNameTextField.accessibilityLabel = "userNameTextField"
        passwordTextField.accessibilityLabel = "passwordTextField"
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let userName = userNameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        interactor.login(userName: userName, password: password)
        self.showError("String")
    }
}

extension LoginViewController: LoginView {
    func showError(_ error: String) {
        errorLabel.isHidden = false
        errorLabel.text = error
    }
    
    func showNextPage() {
        let nextPage = storyboard!.instantiateViewController(withIdentifier: "SuccessViewController") as! SuccessViewController
        show(nextPage, sender: nil)
    }
}

