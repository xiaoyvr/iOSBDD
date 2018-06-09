//
//  PasswordValidator.swift
//  iOSBDD
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

struct PasswordValidator {
    
    func validatePassword(_ password: String) -> ValidatorResult {
        return password.isEmpty ? .passwordError : .success
    }
}
