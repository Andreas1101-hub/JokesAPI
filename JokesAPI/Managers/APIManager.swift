//
//  APIManager.swift
//  JokesAPI
//
//  Created by Andreas Kwong on 04/06/2024.
//

import Foundation

class APIManager: ObservableObject {
    
    static let shared = APIManager()
    
    private init() {}

    func fetchJoke(completion: @escaping (APIResult) -> Void) {
    
        let baseURL = "https://v2.jokeapi.dev/joke/Dark?type=single"
        
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
    
            let decoder = JSONDecoder()
    
            guard let data = data,
                  let results = try? decoder.decode(APIResult.self, from: data) else {
                print("Error decoding")
                return
            }
    
            completion(results)
    
        }
        task.resume()
    }

    
}
