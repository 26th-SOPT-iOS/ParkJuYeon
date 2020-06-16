//
//  APIConstants.swift
//  hw2_Login
//
//  Created by 박주연 on 2020/05/16.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct APIConstants {
    
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
    static let profileURL = APIConstants.baseURL + "/user/profile"
    
}
