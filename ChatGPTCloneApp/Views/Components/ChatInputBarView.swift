//
//  ChatInputBarView.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 08.07.25.
//

import SwiftUI

struct ChatInputBarView: View {
    @Binding var text: String
    var onSend: () -> Void
    @FocusState private var isFocused: Bool

    var body: some View {
            HStack(spacing: 12) {
                TextField("Type a message...", text: $text)
                    .padding(12)
                    .background(Color.white.opacity(0.95))
                    .cornerRadius(20)
                    .focused($isFocused)
                    .onSubmit {
                        handleSend()
                    }

                if !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Button(action: handleSend) {
                        Image(systemName: "paperplane.fill")
                            .rotationEffect(.degrees(45))
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.accentColor)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -2)
        }

    private func handleSend() {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        onSend()
        text = ""
        isFocused = false
    }
}


#Preview {
    ChatInputBarView(
        text: .constant("Hello"),
        onSend: {}
    )
    .padding()
    .background(
        LinearGradient(
            gradient: Gradient(colors: [Color("chatTop"), Color("chatBottom")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    )
}

