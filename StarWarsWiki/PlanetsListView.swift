//
//  ContentView.swift
//  StarWarsWiki
//
//  Created by Samith on 2023-09-14.
//

import SwiftUI

struct PlanetsListView: View {
    @StateObject var planetsVM = PlanetsViewModel()
    
    var body: some View {
        NavigationStack {
            List(planetsVM.planetsArray) { planets in
                Text(planets.name)
            }
            .font(.title)
            .listStyle(.plain)
            .navigationTitle("Planets 🪐")
        }
        .task {
            await planetsVM.getData()
        }
    }
}

struct PlanetsListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsListView()
    }
}
