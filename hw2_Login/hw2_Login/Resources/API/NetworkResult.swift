//
//  NetworkResult.swift
//  hw2_Login
//
//  Created by 박주연 on 2020/05/16.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    
case success(T)
case requestErr(T)
case pathErr
case serverErr
case networkFail

}
