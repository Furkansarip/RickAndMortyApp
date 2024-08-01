//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 30.07.2024.
//

import Foundation

final class NetworkService {
    private init() { }
    
    static let shared = NetworkService()
    
    func retrieveData<T: Decodable>(endpoint: Endpoints, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let baseURL = "https://rickandmortyapi.com/api"
        guard let url = URL(string: "\(baseURL)\(endpoint.rawValue)") else {
            completion(.failure(URLError(.badURL)))
            return
        }
        print(url)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
