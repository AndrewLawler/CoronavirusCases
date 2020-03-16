//
//  NetworkManager.swift
//  coronaCases
//
//  Created by Andrew Lawler on 15/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import Foundation

// Error case

struct Contains: Decodable {
    let value: Int
    let detail: String
}

struct Country: Decodable {
    let confirmed: Contains
    let recovered: Contains
    let deaths: Contains
    let lastUpdate: String?
}

struct DailyStat: Decodable {
    let mainlandChina: Int?
    let otherLocations: Int?
    let totalConfirmed: Int?
    let totalRecovered: Int?
    let reportDateString: String?
    let deltaConfirmed: Int?
    let deltaRecovered: Int?
}

enum FilmError: String, Error {
    case errorSearching    = "There has been an error while searching. Please try again."
}

class NetworkManager {
    
    // Singleton pattern
    static let shared = NetworkManager()
    let countryURL = "https://covid19.mathdro.id/api/countries/"
    let baseURL = "https://covid19.mathdro.id/api/"
    
    private init() {}
    
    // function to get from API
    func getCountry(for country: String, completed: @escaping (Result<Country, FilmError>) -> Void) {
    
        // add year if we have it, if not just search anyway
        var endpoint = countryURL + country
        
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // handle all cases
            
            if let _ = error {
                completed(.failure(.errorSearching))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.errorSearching))
                return
            }
            
            guard let data = data else {
                completed(.failure(.errorSearching))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let country = try decoder.decode(Country.self, from: data)
                completed(.success(country))
                
            } catch {
                completed(.failure(.errorSearching))
            }
            
        }
        
        task.resume()
        
    }
    
    func getOverall(completed: @escaping (Result<Country, FilmError>) -> Void) {
    
        // add year if we have it, if not just search anyway
        var endpoint = baseURL
        
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // handle all cases
            
            if let _ = error {
                completed(.failure(.errorSearching))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.errorSearching))
                return
            }
            
            guard let data = data else {
                completed(.failure(.errorSearching))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let country = try decoder.decode(Country.self, from: data)
                completed(.success(country))
                
            } catch {
                completed(.failure(.errorSearching))
            }
            
        }
        
        task.resume()
        
    }
    
    func getSpecificDay(completed: @escaping (Result<DailyStat, FilmError>) -> Void) {
    
        // add year if we have it, if not just search anyway
        let endpoint = "https://covid19.mathdro.id/api/daily"
        
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // handle all cases
            
            if let _ = error {
                completed(.failure(.errorSearching))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.errorSearching))
                return
            }
            
            guard let data = data else {
                completed(.failure(.errorSearching))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let country = try decoder.decode(DailyStat.self, from: data)
                completed(.success(country))
                
            } catch {
                completed(.failure(.errorSearching))
            }
            
        }
        
        task.resume()
        
    }
    
    
}

