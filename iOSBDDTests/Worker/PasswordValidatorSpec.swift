//
//  PasswordValidatorSpec.swift
//  iOSBDDTests
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Quick
import Nimble

@testable import iOSBDD

class PasswordValidatorSpec: QuickSpec {
    
    override func spec() {
        
        it("should return success when password is not empty") {
            let validator = PasswordValidator()
            
            let result = validator.validatePassword("123")
            
            expect(result).to(equal(ValidatorResult.success))
        }
        
        it("should return passwordError when password is empty") {
            let validator = PasswordValidator()
            
            let result = validator.validatePassword("")
            
            expect(result).to(equal(ValidatorResult.passwordError))
        }
    }
    
}
