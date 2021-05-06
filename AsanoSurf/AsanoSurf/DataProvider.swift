//
//  DataProvider.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//

import Foundation

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func load2(_ fileName: String) -> [Spot] {
    if let file = Bundle.main.url(forResource: fileName, withExtension: nil) {
        do {
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Record.self, from: data)
            return jsonData.records
        } catch {
            print("error:\(error)")
        }
    }
    return [Spot(image: "raté", name: "raté", location: "raté")]
}




class DataProvider {
    var spots:[Spot] = [
            Spot(image: "surf", name: "Surf", location: "8 rue des ecoles"),
            Spot(image: "plage", name: "letsgo", location: "9 rue des ecoles"),
            Spot(image: "beach", name: "trop cool", location: "10 rue des ecoles")]
    var listspot :[Spot] = load("surfData.json")
}

struct Record : Decodable {
    var records: [Spot] =  load2("surfData2.json")
}
