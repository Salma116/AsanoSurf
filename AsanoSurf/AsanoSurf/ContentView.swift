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
            Image(uiImage : spot.fields.photos[0].urlPhoto.loadImage())
                .resizable()
                .scaledToFit()
                .frame(height:300)
            
                Text(spot.fields.name[0])
                    .font(.title)
            
            HStack {
                Text("Niveau de difficulté : ")
            Text(String(spot.fields.level))
                .padding()
            }
            Text(spot.fields.previsionLink)
                .padding()
        }
    }
}


