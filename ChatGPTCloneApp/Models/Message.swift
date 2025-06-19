//
//  Message.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let isUser: Bool
    let content: String
}
