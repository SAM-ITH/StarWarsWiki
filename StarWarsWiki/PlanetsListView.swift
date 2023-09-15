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
            ZStack {
                List(planetsVM.planetsArray) { planets in
                    NavigationLink {
                        DetailPlanetView(planets: planets)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: "https://picsum.photos/200/")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .cornerRadius(15)
                                    .shadow(radius: 15)
                            } placeholder: {
                                Image(systemName: "photo")
                            }
                            VStack(alignment: .leading) {
                                Text(planets.name)
                                Text(planets.climate)
                            }
                        }
                    }
                }
                .font(.title)
                .listStyle(.plain)
                .navigationTitle("Planets 🪐")
                
                if planetsVM.isLoading {
                    ProgressView()
                        .scaleEffect(4)
                        .tint(.red)
                }
            }
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
