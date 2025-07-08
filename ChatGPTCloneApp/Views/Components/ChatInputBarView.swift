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
        HStack {
            TextField("Type a message...", text: $text)
                .textFieldStyle(.roundedBorder)
                .focused($isFocused)
                .onSubmit {
                    handleSend()
                }

            if !text.trimmingCharacters(in: .whitespaces).isEmpty {
                Button(action: handleSend) {
                    Image(systemName: "paperplane.fill")
                        .rotationEffect(.degrees(45))
                        .foregroundColor(.accentColor)
                }
                .padding(.leading, 4)
            }
        }
        .padding()
        .onAppear {
            isFocused = true
        }
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
    @State var input = "Test message"

    return ChatInputBarView(text: .constant("Preview message")) {
        print("Send tapped")
    }
    .padding()
    .previewLayout(.sizeThatFits)
}

