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
    
    var urlPhoto:String = "https://media.istockphoto.com/photos/standing-tall-picture-id143918363?k=6&m=143918363&s=612x612&w=0&h=L9Ia9LQs0w1LnDcNRwU_FMI_bADnw366GFBtVpVAq7k="
    
}

struct Spotfield : Hashable, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "Surf Break"
        case level = "Difficulty Level"
        case previsionLink = "Magic Seaweed Link"
        case photos = "Photos"
    }
    
    var name:[String] = [""]
    var level:Int = 1
    var previsionLink:String = ""
    var photos:[Photo]
    
}


struct Spot : Hashable, Decodable {
    var fields: Spotfield
}


