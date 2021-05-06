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
        NavigationView {
            List{
                ForEach(self.viewModel.spots2, id:\.self){ sp in
                    NavigationLink(
                        destination: ContentView(spot: sp),
                        label: {
                            HStack {
                                Image(sp.image)
                                    .resizable()
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .scaledToFit()
                                    .frame(height: 40)
                                Text(sp.name)
                            }
                          
                        })
                       
                   
                }
            }
            .navigationTitle("Liste des spots")
        }
    }
}



struct ListSpot_Previews: PreviewProvider {
    static var previews: some View {
        ListSpot()
    }
}
