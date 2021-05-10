//
//  SpotModel.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//

import Foundation

struct Photo : Hashable, Decodable {
    enum CodingKeys: String, CodingKey {
        case urlPhoto = "url"
    }
    
    var urlPhoto:String
    
}

struct Spotfield : Hashable, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "Surf Break"
        case level = "Difficulty Level"
        case previsionLink = "Magic Seaweed Link"
        case photos = "Photos"
    }
    
    var name:[String]
    var level:Int
    var previsionLink:String
    var photos:[Photo]
    
}


struct Spot : Hashable, Decodable {
    var fields: Spotfield
}


