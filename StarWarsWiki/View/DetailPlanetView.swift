//
//  DetailPlanetView.swift
//  StarWarsWiki
//
//  Created by Samith on 2023-09-15.
//

import SwiftUI

struct DetailPlanetView: View {
    let planets : Planets
    var body: some View {
        VStack(alignment: .leading){
            Text(planets.name)
                .font(.largeTitle)
                .bold()
            
            Rectangle()
                .frame(height: 2)
                .frame(maxWidth: .infinity)
                .foregroundColor(.gray)
            
            Group {
                HStack(alignment: .top) {
                    Text("Orbital Period :")
                        .bold()
                    Text(planets.orbital_period)
                }
                HStack(alignment: .top) {
                    Text("Gravity :")
                        .bold()
                    Text(planets.gravity)
                }
            }
            .font(.title2)
 
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailPlanetView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlanetView(planets: Planets(name: "Tatooine", orbital_period: "23", climate: "arid", gravity: "1 standard"))
    }
}
