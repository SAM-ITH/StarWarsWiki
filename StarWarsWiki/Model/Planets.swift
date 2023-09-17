//
//  Planets.swift
//  StarWarsWiki
//
//  Created by Samith on 2023-09-15.
//

import Foundation

/// Planets struct is conform to coadable in order to decode the JSON.
struct Planets: Identifiable, Codable {
    let id = UUID().uuidString
    var name = ""
    var orbital_period = ""
    var climate = ""
    var gravity = ""
    
/// coding keys are set since we are not getting any keys from the JSON file. 
    enum CodingKeys: CodingKey {
        case name, orbital_period, climate, gravity
    }
}
