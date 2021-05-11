//
//  AddSpot.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 10/05/2021.
//

import SwiftUI

struct AddSpot: View {
    func createSpot(){
        
    }
    var spot = Spot(fields: Spotfield(photos:[Photo()]))
    @State var name: String = ""
    @State var level: Int = 2
    var levels = [1, 2, 3, 4, 5]
    var body: some View {
        NavigationView{
        Form {
            Section {
                TextField("Nom du spot", text: self.spot.fields.name[0] )
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
    }
    }
}

struct AddSpot_Previews: PreviewProvider {
    static var previews: some View {
        AddSpot()
    }
}
