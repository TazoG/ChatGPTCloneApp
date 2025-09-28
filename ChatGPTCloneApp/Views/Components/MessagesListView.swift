//
//  MessagesListView.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 08.07.25.
//

import SwiftUI

struct MessagesListView: View {
    let messages: [Message]
    let isLoading: Bool
    let bottomID: Namespace.ID
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(messages) { message in
                        MessageBubbleView(message: message)
                            .padding(.horizontal)
                    }
                    
                    if isLoading {
                        LoadingIndicatorView()
                    }
                    
                    Color.clear
                        .frame(height: 1)
                        .id(bottomID)
                }
            }
            .onChange(of: messages.count) { _ in
                withAnimation {
                    proxy.scrollTo(bottomID, anchor: .bottom)
                }
            }
        }
    }
}

#Preview {
    @Namespace var bottomID

    return MessagesListView(
        messages: [
            Message(isUser: true, content: "Hello! How are you?"),
            Message(isUser: false, content: "I'm Gemini! How can I help you today? 😊"),
            Message(isUser: true, content: "Tell me a joke."),
            Message(isUser: false, content: "Why don’t scientists trust atoms? Because they make up everything!")
        ],
        isLoading: true,
        bottomID: bottomID
    )
    .padding()
    .previewLayout(.sizeThatFits)
}

