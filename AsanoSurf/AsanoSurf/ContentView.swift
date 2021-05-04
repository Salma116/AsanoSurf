//
//  ContentView.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 03/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("surf")
            Text("AdaLand")
                .font(.title)
            Text("28 rue du petit musc")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
