//
//  SessionManager.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import UIKit
import Foundation

class SessionManager:NSObject{
    
    var userDefault = UserDefaults.standard
    
    func clearSession(){
        self.userProfile = nil
        
        userDefault.synchronize()
    }
    
    var userProfile:User?{
        set{
            do{
                try userDefault.set(object: newValue, forKey: "UserProfile")
                userDefault.synchronize()
            }
            catch{
                return
            }
        }
        get{
            return try? userDefault.get(objectType: User.self, forKey: "UserProfile")
        }
    }
    
    var isUserLoggedIn:Bool{
        return userProfile == nil ? false:true
    }
    
    var isNotificationEnabled:Bool{
        set{
            userDefault.set(newValue, forKey: "NotificationEnabled")
            userDefault.synchronize()
        }
        get{
            return userDefault.bool(forKey: "NotificationEnabled")
        }
    }
    
    var isDarkModeEnabled:Bool{
        set{
            userDefault.set(newValue, forKey: "isDarkModeEnabled")
            userDefault.synchronize()
        }
        get{
            return userDefault.bool(forKey: "isDarkModeEnabled")
        }
    }
    
    var isSecurityEnabled:Bool{
        set{
            userDefault.set(newValue, forKey: "SecurityEnabled")
            userDefault.synchronize()
        }
        get{
            return userDefault.bool(forKey: "SecurityEnabled")
        }
    }
    
}

public extension UserDefaults {

    /// Set Codable object into UserDefaults
    ///
    /// - Parameters:
    ///   - object: Codable Object
    ///   - forKey: Key string
    /// - Throws: UserDefaults Error
    func set<T: Codable>(object: T, forKey: String) throws {

        let jsonData = try JSONEncoder().encode(object)

        set(jsonData, forKey: forKey)
    }

 
    func get<T: Codable>(objectType: T.Type, forKey: String) throws -> T? {

        guard let result = value(forKey: forKey) as? Data else {
            return nil
        }

        return try JSONDecoder().decode(objectType, from: result)
    }
}
