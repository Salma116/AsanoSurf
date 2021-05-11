//
//  AddSpot.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 10/05/2021.
//

import SwiftUI

struct AddSpot: View {
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    func createSpot(){
        var spot = Spot(fields: Spotfield(name:name, level:level, photos:[Photo()]))
        
        guard let encoded = try? JSONEncoder().encode(spot) else {
            print("Failed to encode spot")
            return
        }
        print(String(data: encoded, encoding: .utf8)!)
        print("encoded : ",encoded)
        
        let url = URL(string: "https://api.airtable.com/v0/appxT9ln6ixuCb3o1/Surf%20Destinations")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer keyw35g3YFNptmLBx", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = encoded
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            print("Data : ", data)
            let str = String(decoding: data, as: UTF8.self)
            print(str)
            let decoder = JSONDecoder()
            if let decodedSpot = try? decoder.decode(Spot.self, from: data) {
                print(decodedSpot)
                self.confirmationMessage = "Votre spot  \(decodedSpot.fields.name[0]) a bien été enregistré !"
                self.showingConfirmation = true
                
            } else {
                print("Invalid response from server")
                
            }
            
            
        }.resume()
    }
   
    @State var name: [String] = [""]
    @State var level: Int = 2
    var levels = [1, 2, 3, 4, 5]
    var body: some View {
        NavigationView{
        Form {
            Section {
                TextField("Nom du spot", text: $name[0] )
                Picker("Difficulté", selection: $level, content: {
                                   ForEach(levels, id: \.self) {level in
                                    Text(String(level))
                                   }
                               })
            }

            Section {
                Button("Ajouter le spot") {
                    
                    self.createSpot()
                    print("Creating account…")
                }
                }
            }

        }.alert(isPresented: $showingConfirmation) {
            Alert(title: Text("Thank you!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
    }
    }
}

struct AddSpot_Previews: PreviewProvider {
    static var previews: some View {
        AddSpot()
    }
}
