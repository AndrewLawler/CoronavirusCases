//
//  Country.swift
//  coronaCases
//
//  Created by Andrew Lawler on 16/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import Foundation

struct Contains: Decodable {
    let value: Int
    let detail: String
}

struct Country: Decodable {
    let confirmed: Contains
    let recovered: Contains
    let deaths: Contains
    let lastUpdate: String?
}
