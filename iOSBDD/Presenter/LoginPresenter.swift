//
//  LoginPresenter.swift
//  iOSBDD
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol {
    func showError(validationResult: ValidatorResult)
    func showNextPage()
}

class LoginPresenter: LoginPresenterProtocol {
    
    private weak var view: LoginView?
    
    init(view: LoginView) {
        self.view = view
    }
    
    func showError(validationResult: ValidatorResult) {
        switch validationResult {
        case .passwordError:
            view?.showError("Password Error")
        case .userNameError:
            view?.showError("User Name Error")
        case .success:
            showNextPage()
        }
    }
    
    func showNextPage() {
        view?.showNextPage()
    }
}
