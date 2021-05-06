//
//  DataProvider.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//

import Foundation



func load2(_ filename: String) -> Record{
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
        return try decoder.decode(Record.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(Record.self):\n\(error)")
    }
    
}





class DataProvider {
    var recordsListSpot :[Spot] = load2("surfData.json").records
    
}

struct Record : Decodable {
    var records: [Spot]
}

