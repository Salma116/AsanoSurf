//
//  ViewModel.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//

import Foundation

    class ViewModel: ObservableObject {
       
        var dataProvider: DataProvider
        var spots: [Spot]
        
        
        init (){
            self.dataProvider = DataProvider()
            self.spots = dataProvider.recordsListSpot
        }
   
    }

