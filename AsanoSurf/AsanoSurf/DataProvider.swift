//
//  DataProvider.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//

import Foundation

class DataProvider {
    func getSpots() -> [Spot]{
        return [
            Spot(image: "surf", name: "Surf", location: "8 rue des ecoles"),
            Spot(image: "plage", name: "letsgo", location: "9 rue des ecoles"),
            Spot(image: "beach", name: "trop cool", location: "10 rue des ecoles")]
    }
}
