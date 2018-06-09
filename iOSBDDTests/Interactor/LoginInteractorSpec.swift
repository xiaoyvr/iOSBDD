//
//  LoginInteractorSpec.swift
//  iOSBDDTests
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Quick
import Nimble

@testable import iOSBDD

class MockLoginPresenter: LoginPresenterProtocol {
    
    var shouldShowNextPage: Bool = false
    var result: ValidatorResult = .success
    
    func showError(validationResult: ValidatorResult) {
        result = validationResult
    }
    
    func showNextPage() {
        shouldShowNextPage = true
    }
}

class LoginInteractorSpec: QuickSpec {
    override func spec() {
        
        var presenter: MockLoginPresenter!
        
        beforeEach {
            presenter = MockLoginPresenter()
        }
        
        it("should show next page when user name and password are both valid") {
            let interactor = LoginInteractor(presenter: presenter)
            
            interactor.login(userName: "John X", password: "1234")
            
            expect(presenter.shouldShowNextPage).to(beTrue())
        }
        
        it("should show user name error") {
            let interactor = LoginInteractor(presenter: presenter)
            
            interactor.login(userName: "Jo", password: "1234")
            
            expect(presenter.result).to(equal(.userNameError))
            expect(presenter.shouldShowNextPage).to(beFalse())
        }
        
        it("should show password error") {
            let interactor = LoginInteractor(presenter: presenter)
            
            interactor.login(userName: "John X", password: "")
            
            expect(presenter.result).to(equal(.passwordError))
            expect(presenter.shouldShowNextPage).to(beFalse())
        }
    }
}
