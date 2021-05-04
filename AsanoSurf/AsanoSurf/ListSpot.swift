//
//  ListSpot.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//

import SwiftUI

struct ListSpot: View {
    @ObservedObject var viewModel : ViewModel = ViewModel()
    
    var body: some View {
//        List(viewModel.spots){
//            spot in Text(spot.name)
//        }
        List{
            ForEach(self.viewModel.spots, id:\.self){ spot in
                Text(spot.name)
            }
        }
    }
}

struct ListSpot_Previews: PreviewProvider {
    static var previews: some View {
        ListSpot()
    }
}
