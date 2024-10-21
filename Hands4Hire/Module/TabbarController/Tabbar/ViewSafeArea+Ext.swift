//
//  ViewSafeArea+Ext.swift
//
//
//  Created by Nouman Gul Junejo on 04/08/2023.
//

import SwiftUI

extension View {
    func getSafeArea() -> UIEdgeInsets {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
                return keyWindow.safeAreaInsets
            }
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

