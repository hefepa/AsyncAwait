//
//  PhoneModel.swift
//  AsyncAwaitProject
//
//  Created by WEMA on 17/01/2024.
//

import Foundation
struct PhoneModel: Codable {
    let products: [PhoneProperties]?
}

struct PhoneProperties: Codable {
    let title: String?
    let price: Double?
    let thumbnail: String?
}
