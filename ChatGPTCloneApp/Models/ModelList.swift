//
//  ModelList.swift
//  ChatGPTCloneApp
//
//  Created by Tazo Gigitashvili on 08.07.25.
//

import Foundation

struct ModelList: Codable {
    struct Model: Codable {
        let name: String
        let supportedGenerationMethods: [String]?
    }
    let models: [Model]
}

