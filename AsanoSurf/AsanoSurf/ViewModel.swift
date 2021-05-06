//
//  ViewModel.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//

import Foundation

    class ViewModel: ObservableObject {
        var spots: [Spot] = []
        var dataProvider: DataProvider
        var record: Record
        var spots2: [Spot]
        
        
        init (){
            self.dataProvider = DataProvider()
            self.spots = dataProvider.listspot
            self.record = Record()
            self.spots2 = record.records
        }
   
    }

