//
//  K.swift
//  Big Bite
//
//  Created by Andrey Alymov on 22.09.2021.
//

import Foundation
import Firebase

struct K {
    
    struct Firebase {
        
        var userName: String? {
            let user = Auth.auth().currentUser
            if let user = user {
                return user.email!
            } else {
                print("Current user not found")
                return "1"
            }
        }
    }
    
}
