//
//  SettingsViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 29/07/2024.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var notificationsEnabled: Bool {
        didSet {
            Theme.sessionManager.isNotificationEnabled = notificationsEnabled
        }
    }
    
    @Published var faceIDEnabled: Bool {
        didSet {
            Theme.sessionManager.isSecurityEnabled = faceIDEnabled
        }
    }
    
    init(){
        notificationsEnabled = Theme.sessionManager.isNotificationEnabled
        faceIDEnabled = Theme.sessionManager.isSecurityEnabled
    }
}
