//
//  AlertParams.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 11/11/2024.
//

import SwiftUI

typealias EmptyCallback = () -> Void

// Custom Equatable conformance, excluding `confirmAction`
extension AlertParams: Equatable {
    static func == (lhs: AlertParams, rhs: AlertParams) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.message == rhs.message &&
            lhs.confirmButtonText == rhs.confirmButtonText
    }
}


// Custom Equatable conformance, excluding `confirmAction`
extension AlertParams: Hashable {    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(message)
        hasher.combine(confirmButtonText)
    }
}

struct AlertParams: Identifiable, Codable {
    var id = UUID()                   // Unique ID for each alert instance
    var title: String                 // Title of the alert
    var message: String               // Message body of the alert
    var confirmButtonText: String = "OK" // Text for the confirm button
    
    // This property is excluded from Codable
    var confirmAction: EmptyCallback?
    
    // Custom coding keys to exclude confirmAction
    private enum CodingKeys: String, CodingKey {
        case id, title, message, confirmButtonText
    }
    
    // Initializer for AlertParams
    init(id: UUID = UUID(), title: String, message: String, confirmButtonText: String = "OK", confirmAction: EmptyCallback? = nil) {
        self.id = id
        self.title = title
        self.message = message
        self.confirmButtonText = confirmButtonText
        self.confirmAction = confirmAction
    }
    
    // Custom encoding and decoding to exclude confirmAction
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(message, forKey: .message)
        try container.encode(confirmButtonText, forKey: .confirmButtonText)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        message = try container.decode(String.self, forKey: .message)
        confirmButtonText = try container.decode(String.self, forKey: .confirmButtonText)
        confirmAction = nil // Set to nil since it can't be decoded
    }
}
