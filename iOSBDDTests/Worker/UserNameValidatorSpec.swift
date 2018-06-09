//
//  UserNameValidatorSpec.swift
//  iOSBDDTests
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Quick
import Nimble

@testable import iOSBDD

class UserNameValidatorSpec: QuickSpec {
    override func spec() {
        it("should return success when username is more than 4 characters") {
            let validator = UserNameValidator()
            
            let result = validator.validateUserName("John X")
            
            expect(result).to(equal(ValidatorResult.success))
        }
        
        it("should return usernameError when username is less than 4 characters") {
            let validator = UserNameValidator()
            
            let result = validator.validateUserName("")
            
            expect(result).to(equal(ValidatorResult.userNameError))
        }
    }
}
