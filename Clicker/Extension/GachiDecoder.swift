//
//  GachiDecoder.swift
//  Clicker
//
//  Created by Павел Кай on 18.03.2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate fucking\(file) in fucking bundle")
        }
        
        // 2. Create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load fucking\(file) from fucking bundle")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode fucking\(file) from fucking bundle")
        }
        
        // 5. Return the ready-to-use data
        return loaded
    }
}
