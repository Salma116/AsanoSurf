//
//  ContentView.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 03/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    var spot: Spot
    
    var body: some View {
        VStack {
            Image(spot.image)
                .resizable()
                .scaledToFit()
                .frame(height:300)
            
            Text(spot.name)
                .font(.title)
            Text(spot.location)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(spot: Spot(image: "surf", name: "surf", location: "surf"))
        }
    }
}
