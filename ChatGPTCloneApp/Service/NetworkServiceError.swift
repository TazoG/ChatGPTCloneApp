//
//  NetworkServiceError.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

enum GeminiNetworkError: Error, LocalizedError {
    case invalidURL
    case missingAPIKey
    case decodingError
    case serverError(String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "❌ URL is invalid"
        case .missingAPIKey:
            return "❌ Missing Gemini API key"
        case .decodingError:
            return "❌ Failed to decode Gemini response"
        case .serverError(let message):
            return "❌ Gemini API Error: \(message)"
        }
    }
}

