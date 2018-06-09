//
//  LoginInteractor.swift
//  iOSBDD
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol {
    func login(userName: String, password: String)
}

class LoginInteractor: LoginInteractorProtocol {
    
    private let presenter: LoginPresenterProtocol
    private let userNameValidator = UserNameValidator()
    private let passwordValidator = PasswordValidator()
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }
    
    func login(userName: String, password: String) {
        let userNameResult = userNameValidator.validateUserName(userName)
        let passwordResult = passwordValidator.validatePassword(password)
        
        if userNameResult != .success {
            presenter.showError(validationResult: userNameResult)
            return
        }
        if passwordResult != .success {
            presenter.showError(validationResult: passwordResult)
            return
        }
        
        presenter.showNextPage()
    }
}
