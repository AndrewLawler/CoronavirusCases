//
//  NetworkManager.swift
//  coronaCases
//
//  Created by Andrew Lawler on 15/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import Foundation

class NetworkManager {
    
    // Singleton pattern
    static let shared = NetworkManager()
    let countryURL = "https://covid19.mathdro.id/api/countries/"
    let baseURL = "https://covid19.mathdro.id/api/"
    
    private init() {}
    
    // function to get from API
    func getCountry(for country: String, completed: @escaping (Result<Country, CoronaError>) -> Void) {
    
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
    
    func getOverall(completed: @escaping (Result<Country, CoronaError>) -> Void) {
    
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
    
    func getSpecificDay(for date: String, completed: @escaping (Result<[DailyStat], CoronaError>) -> Void) {
    
        // add year if we have it, if not just search anyway
        let baseURL = "https://covid19.mathdro.id/api/daily/"
        let endpoint = baseURL + date
        
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
                
                let country = try decoder.decode([DailyStat].self, from: data)
                completed(.success(country))
                
            } catch {
                completed(.failure(.errorSearching))
            }
            
        }
        
        task.resume()
        
    }
    
    
}

