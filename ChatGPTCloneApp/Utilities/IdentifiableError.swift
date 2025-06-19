//
//  IdentifiableError.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 19.06.25.
//

import Foundation

struct IdentifiableError: Identifiable {
    var id: String { message }
    let message: String
}
