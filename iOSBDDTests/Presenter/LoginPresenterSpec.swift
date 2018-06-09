//
//  LoginPresenterSpec.swift
//  iOSBDDTests
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Quick
import Nimble

@testable import iOSBDD

class MockLoginViewController: LoginView {
    
    var errorMsg: String = ""
    var didShowNextPage: Bool = false
    
    func showError(_ error: String) {
        errorMsg = error
    }
    
    func showNextPage() {
        didShowNextPage = true
    }
}

class LoginPresenterSpec: QuickSpec {
    
    override func spec() {
        var view: MockLoginViewController!
        
        beforeEach {
            view = MockLoginViewController()
        }
        
        it("should show user name error") {
            let presenter = LoginPresenter(view: view)

            presenter.showError(validationResult: .userNameError)

            expect(view.errorMsg).to(equal("User Name Error"))
            expect(view.didShowNextPage).to(beFalse())
        }

        it("should show next page") {
            let presenter = LoginPresenter(view: view)

            presenter.showNextPage()

            expect(view.didShowNextPage).to(beTrue())
        }

        it("should show password error") {
            let presenter = LoginPresenter(view: view)
            
            presenter.showError(validationResult: .passwordError)
            
            expect(view.errorMsg).to(equal("Password Error"))
            expect(view.didShowNextPage).to(beFalse())
        }
        

        it("should show next page when validate result is success") {
            let presenter = LoginPresenter(view: view)
            
            presenter.showError(validationResult: .success)
            
            expect(view.didShowNextPage).to(beTrue())
        }
    }
}
