//
//  Rate.swift
//  CoinGeckoApp
//
//  Created by Nikolai Maksimov on 30.06.2022.
//

import Foundation


// MARK: - Rate
struct Rate: Codable {
    let rates: [String: RateValue]
}

// MARK: - RateValue
struct RateValue: Codable {
    let name: String
    let unit: String
    let value: Double
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case commodity = "commodity"
    case crypto = "crypto"
    case fiat = "fiat"
}
