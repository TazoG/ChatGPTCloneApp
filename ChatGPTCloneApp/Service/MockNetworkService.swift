//
//  MockNetworkService.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

final class MockNetworkService: NetworkService {
    func sendMessage(_ message: String) async throws -> String {
        return "Mock response for: \(message)"
    }
}
