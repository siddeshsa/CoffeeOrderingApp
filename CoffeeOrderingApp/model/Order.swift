//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by Siddesh A on 16/05/21.
//

import Foundation

struct Order: Codable{
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
