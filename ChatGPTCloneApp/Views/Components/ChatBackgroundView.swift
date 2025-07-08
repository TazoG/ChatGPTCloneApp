//
//  ChatBackgroundView.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 09.07.25.
//

import SwiftUI

struct ChatBackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color("chatTop"), Color("chatBottom")]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    ChatBackgroundView()
}
