//
//  MainView.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 10/05/2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        TabView{
            ListSpot()
                .tabItem{
                    Text("Spots")
                }
            AddSpot()
                .tabItem{
                    Text("Ajouter un spot")
                }
            }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
