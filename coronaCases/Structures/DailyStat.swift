//
//  DailyStat.swift
//  coronaCases
//
//  Created by Andrew Lawler on 16/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import Foundation

struct DailyStat: Decodable {
    let provinceState: String?
    let countryRegion: String?
    let lastUpdate: String?
    let confirmed: String?
    let deaths: String?
    let recovered: String?
    let latitude: String?
    let longitude: String?
}
 
