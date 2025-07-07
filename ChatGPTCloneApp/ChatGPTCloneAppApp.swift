//
//  ChatGPTCloneAppApp.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import SwiftUI

@main
struct ChatGPTCloneAppApp: App {
    @StateObject private var viewModel = ChatViewModel(networkService: GeminiNetworkService())

    var body: some Scene {
        WindowGroup {
            ChatView(viewModel: viewModel)
        }
    }
}
