//
//  PlanetsViewModel.swift
//  StarWarsWiki
//
//  Created by Samith on 2023-09-15.
//

import Foundation

@MainActor

class PlanetsViewModel: ObservableObject {
    struct Returned: Codable {
        var next: String? // Oprional because its going to be null on the final page
        var results: [Planets]
    }
    
    @Published var planetsArray: [Planets] = []
    var urlString = "https://swapi.dev/api/planets/"
    
    func getData() async {
        print("🕸️ able to access the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: not able to convert \(urlString) to a URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data)
                urlString = returned.next ?? ""
                planetsArray = returned.results
            } catch {
                print("😡 JSON ERROR: Could not convert data into JSON. \(error.localizedDescription)")
            }
        } catch {
            print("😡 ERROR: could not get data from urlString \(urlString)")
        }
    }
}
