//
//  ContentView.swift
//  StarWarsWiki
//
//  Created by Samith on 2023-09-14.
//

import SwiftUI

struct PlanetsListView: View {
    @State private var planetArray = ["Tatooine", "Alderaan", "Yavin IV", "Hoth"]
    var body: some View {
        NavigationStack {
            List(planetArray, id: \.self) { planets in
                Text(planets)
            }
            .font(.title)
            .listStyle(.plain)
            .navigationTitle("Planets 🪐")
        }
    }
}

struct PlanetsListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsListView()
    }
}
