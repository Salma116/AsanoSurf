//
//  ViewModel.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//

import Foundation
extension ListSpot{
    class ViewModel: ObservableObject {
        var spots: [Spot] = []
        var dataProvider: DataProvider
        
        init (){
            self.dataProvider = DataProvider()
            self.spots = dataProvider.getSpots()
        }
   
    }
}