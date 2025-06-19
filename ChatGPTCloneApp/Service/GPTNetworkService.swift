//
//  GPTNetworkService.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

final class GPTNetworkService: NetworkService {
    private let apiKey: String
    private let session: URLSession
    private let baseURL = URL(string: "https://api.openai.com/v1/chat/completions")!

    init(apiKey: String? = ProcessInfo.processInfo.environment["OPENAI_API_KEY"],
         session: URLSession = .shared) {
        guard let key = apiKey else {
            fatalError("❌ OPENAI_API_KEY not found in environment")
        }
        self.apiKey = key
        self.session = session
    }

    func sendMessage(_ message: String) async throws -> String {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "user", "content": message]
            ]
        ]

        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, response) = try await session.data(for: request)

        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            let errorString = String(data: data, encoding: .utf8) ?? "Unknown server error"
            throw GPTNetworkError.serverError(errorString)
        }

        do {
            let decoded = try JSONDecoder().decode(GPTResponse.self, from: data)
            return decoded.choices.first?.message.content ?? "(no content)"
        } catch {
            throw GPTNetworkError.decodingError
        }
    }
}

