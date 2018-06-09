//
//  UserNameValidator.swift
//  iOSBDD
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

struct UserNameValidator {
    
    private let MIN_COUNT = 4
    
    func validateUserName(_ userName: String) -> ValidatorResult {
        if userName.count < MIN_COUNT {
            return .userNameError
        }
        return .success
    }
}
