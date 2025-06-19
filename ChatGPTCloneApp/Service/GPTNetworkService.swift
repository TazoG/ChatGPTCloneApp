//
//  GPTNetworkService.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

final class GPTNetworkService: NetworkService {
    private let apiKey: String

    init() {
        guard let key = ProcessInfo.processInfo.environment["OPENAI_API_KEY"] else {
            fatalError("❌ OPENAI_API_KEY not found in environment")
        }
        self.apiKey = key

        print("🔑 API KEY:", ProcessInfo.processInfo.environment["OPENAI_API_KEY"] ?? "Not Found")

    }

    func sendMessage(_ message: String) async throws -> String {
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            throw URLError(.badURL)
        }

        let headers = [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]

        let body: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "user", "content": message]
            ]
        ]

        let jsonData = try JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = jsonData

        let (data, _) = try await URLSession.shared.data(for: request)
        let decoded = try JSONDecoder().decode(GPTResponse.self, from: data)
        return decoded.choices.first?.message.content ?? "No response"
    }
}

