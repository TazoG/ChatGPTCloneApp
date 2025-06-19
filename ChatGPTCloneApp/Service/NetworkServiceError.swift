//
//  NetworkServiceError.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

enum GPTNetworkError: Error, LocalizedError {
    case invalidURL
    case missingAPIKey
    case decodingError
    case serverError(String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "❌ URL is invalid"
        case .missingAPIKey:
            return "❌ Missing OpenAI API key"
        case .decodingError:
            return "❌ Failed to decode GPT response"
        case .serverError(let message):
            return "❌ GPT API Error: \(message)"
        }
    }
}

