//
//  FriendInformation.swift
//  hw2_Login
//
//  Created by 박주연 on 2020/05/13.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct FriendInformation {
    var friend: Friend
    var name: String
    var title: String
    init(friend: Friend, name: String, title: String) {
        self.friend = friend
        self.name = name
        self.title = title
    }
    
}
enum Friend{
    case cat
    case dog
    
    func getImageName() -> String {
        switch self {
        case .cat: return "profile8Img"
        case .dog: return "profile3Img"
            
        }
    }
    
}
