//
//  SignupService.swift
//  hw2_Login
//
//  Created by 박주연 on 2020/05/16.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation
import Alamofire

struct SignupService {
    
    static let shared = SignupService()
    private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ phone: String) -> Parameters {
        return ["id": id, "password": pwd, "name": name, "email": email, "phone": phone]
    }
}
