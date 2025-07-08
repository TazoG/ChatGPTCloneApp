//
//  ChatView.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel: ChatViewModel
    @State private var userInput: String = ""
    @FocusState private var isInputFocused: Bool
    @Namespace private var bottomID

    init(viewModel: ChatViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {

            ChatBackgroundView()

            VStack(spacing: 0) {
                MessagesListView(
                    messages: viewModel.messages,
                    isLoading: viewModel.isLoading,
                    bottomID: bottomID
                )

                Divider()

                ChatInputBarView(text: $userInput, onSend: send)
            }
            .navigationTitle("Tazo AI Chat")
            .navigationBarTitleDisplayMode(.inline)
            .alert(item: $viewModel.error) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func send() {
        let trimmed = userInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        viewModel.sendMessage(trimmed)
        userInput = ""
        isInputFocused = false
    }
}

#Preview {
    let mockService = MockNetworkService()
    let vm = ChatViewModel(networkService: mockService)
    return ChatView(viewModel: vm)
}
