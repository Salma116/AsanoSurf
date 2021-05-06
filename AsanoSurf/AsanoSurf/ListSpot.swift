//
//  ListSpot.swift
//  AsanoSurf
//
//  Created by Salma ElMourabet on 04/05/2021.
//

import SwiftUI

extension String {
    
    func loadImage() -> UIImage {
        do {
            
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data:Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        return UIImage()
    }
}

struct ListSpot: View {
    @ObservedObject var viewModel : ViewModel = ViewModel()
    
    var body: some View {

        NavigationView {
            List{
                ForEach(self.viewModel.spots, id:\.self){ sp in
                  
                    NavigationLink(
                        destination: ContentView(spot: sp),
                        label: {
                            HStack {
                                Image(uiImage : sp.fields.photos[0].urlPhoto.loadImage())
                                    .resizable()
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .scaledToFit()
                                    .frame(height: 40)
                               
                                Text(sp.fields.name[0])
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
