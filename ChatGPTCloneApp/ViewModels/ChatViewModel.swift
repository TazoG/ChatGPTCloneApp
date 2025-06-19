//
//  ChatViewModel.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

@MainActor
final class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var isLoading: Bool = false
    @Published var error: IdentifiableError?

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func sendMessage(_ text: String) {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }

        let userMessage = Message(isUser: true, content: text)
        messages.append(userMessage)
        isLoading = true
        error = nil

        Task {
            do {
                let response = try await networkService.sendMessage(text)
                let gptMessage = Message(isUser: false, content: response)
                messages.append(gptMessage)
            } catch {
                self.error = IdentifiableError(message: error.localizedDescription)
            }
            isLoading = false
        }
    }
}

