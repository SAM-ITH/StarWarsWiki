//
//  Planets.swift
//  StarWarsWiki
//
//  Created by Samith on 2023-09-15.
//

import Foundation

struct Planets: Identifiable, Codable {
    let id = UUID().uuidString
    var name = ""
    var orbital_period = ""
    var climate = ""
    var gravity = ""
    
    enum CodingKeys: CodingKey {
        case name, orbital_period, climate, gravity
    }
}
