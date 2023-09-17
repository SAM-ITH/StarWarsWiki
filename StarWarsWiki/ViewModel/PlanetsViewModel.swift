//
//  PlanetsViewModel.swift
//  StarWarsWiki
//
//  Created by Samith on 2023-09-15.
//

import Foundation

/// @MainActor is used To ensure that the view model's properties and methods are only accessed from the main thread
@MainActor

/// PlanetsViewModel is conform to observableObject to keep data in sync with the user interface.
class PlanetsViewModel: ObservableObject {
    
    struct AppError: Identifiable {
        let id = UUID().uuidString
        let errorString: String
    }
    
    struct Returned: Codable {
        var next: String? // Oprional because its going to be null on the final page
        var results: [Planets]
    }
    
    @Published var planetsArray: [Planets] = []
    @Published var isLoading = false
    var appError: AppError? = nil
    var urlString = "https://swapi.dev/api/planets/"
    
    // MARK: Get data function
    /// get data function first call the URLSession and retrieve the data then parse the retrieved JSON data so thats its passed into variable of type returned, with the approprate array data paased into published property PlanetsArray
    func getData() async {
        isLoading = true
        print("🕸️ able to access the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: not able to convert \(urlString) to a URL")
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data)
                urlString = returned.next ?? ""
                planetsArray += returned.results
                isLoading = false
            } catch {
                print("😡 JSON ERROR: Could not convert data into JSON. \(error.localizedDescription)")
                isLoading = false
            }
        } catch {
            self.appError = AppError(errorString: "Data Could Not be load")
            print("😡 ERROR: could not get data from urlString \(urlString)")
            isLoading = false
        }
    }
    
    /// load the next page of data since API load 10 of planets for each call so this function will call the next set of planets until all the planets are retrived. 
    func loadNextPage(planets: Planets) async {
        guard let lastPlanets = planetsArray.last else {return}
        if lastPlanets.id == planets.id &&  urlString != "" {
            await getData()
        }
    }
    
    var cardIconURL: URL {
        let urlString = "https://picsum.photos/100/"
        return URL(string: urlString)!
    }
}
