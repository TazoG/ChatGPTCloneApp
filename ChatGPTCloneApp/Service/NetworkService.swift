//
//  NetworkService.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

protocol NetworkService {
    func sendMessage(_ message: String) async throws -> String
}
