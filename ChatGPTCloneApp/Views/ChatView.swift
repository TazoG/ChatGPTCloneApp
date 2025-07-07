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
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(viewModel.messages) { message in
                            MessageBubbleView(message: message)
                                .padding(.horizontal)
                        }

                        if viewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                                .padding()
                        }

                        Color.clear
                            .frame(height: 1)
                            .id(bottomID)
                    }
                }
//                .onAppear {
//                    viewModel.testModels()
//                }
                .onChange(of: viewModel.messages.count) { _ in
                    withAnimation {
                        proxy.scrollTo(bottomID, anchor: .bottom)
                    }
                }
            }

            Divider()

            HStack {
                TextField("Type a message...", text: $userInput)
                    .textFieldStyle(.roundedBorder)
                    .focused($isInputFocused)
                    .onSubmit {
                        send()
                    }

                if !userInput.trimmingCharacters(in: .whitespaces).isEmpty {
                    Button(action: send) {
                        Image(systemName: "paperplane.fill")
                            .rotationEffect(.degrees(45))
                            .foregroundColor(.accentColor)
                    }
                    .padding(.leading, 4)
                }
            }
            .padding()
        }
        .navigationTitle("ChatGPT")
        .navigationBarTitleDisplayMode(.inline)
        .alert(item: $viewModel.error) { error in
            Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
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
