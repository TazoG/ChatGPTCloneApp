//
//  MessageBubbleView.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import SwiftUI

struct MessageBubbleView: View {
    let message: Message

    var body: some View {
        HStack {
            if message.isUser { Spacer() }

            Text(message.content)
                .padding(12)
                .background(message.isUser ? Color.blue.opacity(0.85) : Color.gray.opacity(0.15))
                .foregroundColor(message.isUser ? .white : .primary)
                .cornerRadius(16)
                .frame(maxWidth: 280, alignment: message.isUser ? .trailing : .leading)
                .shadow(radius: 1)

            if !message.isUser { Spacer() }
        }
        .padding(.vertical, 2)
    }
}


#Preview {
    VStack {
        MessageBubbleView(message: Message(isUser: true, content: "Hello from user"))
        MessageBubbleView(message: Message(isUser: false, content: "Hello from GPT"))
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
