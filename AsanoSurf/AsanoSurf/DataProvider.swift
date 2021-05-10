//
//  DataProvider.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//  Apikey = keyw35g3YFNptmLBx
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
    
    func apiCall(completion:@escaping ([Spot]) -> ()) {
        guard let url = URL(string: "https://api.airtable.com/v0/appxT9ln6ixuCb3o1/Surf%20Destinations?api_key=keyw35g3YFNptmLBx") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Record.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        completion(decodedResponse.records)
                        
                    }

                    // everything is good, so we can exit
                    return
                    
                }
            }
        }.resume()
        
        
    }
   // var recordsListSpot :[Spot] = []
    
    
}

struct Record : Decodable {
    var records: [Spot]
}

