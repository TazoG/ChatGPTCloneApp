//
//  GPTNetworkService.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

final class GeminiNetworkService: NetworkService {
    private let apiKey: String
    private let session: URLSession
    private let baseURL = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent")!


    init(apiKey: String? = ProcessInfo.processInfo.environment["GEMINI_API_KEY"],
         session: URLSession = .shared) {
        guard let key = apiKey else {
            fatalError("❌ GEMINI_API_KEY not found in environment")
        }

        self.apiKey = key
        self.session = session
    }

//    func fetchAvailableModels() async throws {
//        let apiKey = ProcessInfo.processInfo.environment["GEMINI_API_KEY"] ?? ""
//        guard !apiKey.isEmpty else {
//            print("❌ GEMINI_API_KEY არ მოიძებნა")
//            return
//        }
//
//        let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models?key=\(apiKey)")!
//        let (data, _) = try await URLSession.shared.data(from: url)
//
//        let modelList = try JSONDecoder().decode(ModelList.self, from: data)
//
//        print("✅ ხელმისაწვდომი მოდელები:")
//        for model in modelList.models {
//            let methods = model.supportedGenerationMethods?.joined(separator: ", ") ?? "no methods"
//            print("- \(model.name) [supports: \(methods)]")
//        }
//    }

    func sendMessage(_ message: String) async throws -> String {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        components.queryItems = [URLQueryItem(name: "key", value: apiKey)]

        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "contents": [
                [
                    "role": "user",
                    "parts": [["text": message]]
                ]
            ]
        ]

        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, response) = try await session.data(for: request)

        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            let errorString = String(data: data, encoding: .utf8) ?? "Unknown server error"
            throw GeminiNetworkError.serverError(errorString)
        }

        do {
            let decoded = try JSONDecoder().decode(GeminiResponse.self, from: data)
            return decoded.candidates.first?.content.parts.first?.text ?? "(no content)"
        } catch {
            throw GeminiNetworkError.decodingError
        }
    }
}

