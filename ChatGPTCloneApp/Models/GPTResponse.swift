//
//  GPTResponse.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

struct GPTResponse: Codable {
    struct Choice: Codable {
        let message: ChatMessage
    }

    struct ChatMessage: Codable {
        let role: String
        let content: String
    }

    let choices: [Choice]
}
