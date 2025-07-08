//
//  LoadingIndicatorView.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 08.07.25.
//

import SwiftUI

struct LoadingIndicatorView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .padding()
    }
}

#Preview {
    LoadingIndicatorView()
}
