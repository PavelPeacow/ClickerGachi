//
//  GachiPowers.swift
//  Clicker
//
//  Created by Павел Кай on 18.03.2022.
//

import Foundation

struct GachiPowersModel: Codable, Identifiable {
    let id: Int
    let price: Int
    let name: String
    let power: Int
}
