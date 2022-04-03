//
//  bossesModel.swift
//  Clicker
//
//  Created by Павел Кай on 23.03.2022.
//

import Foundation

struct bossesModel: Codable, Identifiable {
    let id: Int
    let name: String
    let hp: Int
    let image: String
}
