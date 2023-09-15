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
                    LazyVStack {
                        NavigationLink {
                            DetailPlanetView(planets: planets)
                        } label: {
                            HStack {
                                AsyncImage(url: planetsVM.cardIconURL) { image in
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
                    .task {
                        await planetsVM.loadNextPage(planets: planets)
                    }
                }
                .font(.title)
                .listStyle(.plain)
                .navigationTitle("Planets 🪐")
                .alert(item: $planetsVM.appError) { appAlert in
                    Alert(title: Text("Error"),
                          message: Text("""
                            \(appAlert.errorString)
                            Please try again later!
                            """
                                       )
                    )
                }
                
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
