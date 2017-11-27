//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Kudryatzhan Arziyev on 11/27/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    //static URL
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    // static function for results
    static func searchRepresentatives(forState state: String, completion: @escaping ((_ results: [Representative]) -> Void)) {
        
        //url
        guard let url = baseURL else { completion([]); return }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let stateNameQueryItem = URLQueryItem(name: "state", value: "\(state)")
        let jsonFormatQueryItem = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [stateNameQueryItem, jsonFormatQueryItem]
        
        guard let requestURL = components?.url else { completion([]); return }
        print(requestURL)
        
        //request
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        //create data task and make sure to run it
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else { completion([]); return }
            
            let decoder = JSONDecoder()
            
            guard let congress = try? decoder.decode(Congress.self, from: data) else { completion([]); return }
            completion(congress.results)
            
        }
        dataTask.resume()
    }
}
