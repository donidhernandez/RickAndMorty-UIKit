//
//  APIClient.swift
//  RickAndMorty-UIKit
//
//  Created by Doni on 7/4/23.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidStatusCode(statusCode: Int)
    case invalidData
    case failedToDecode(error: Error)
}

final class APIClient {
    
    let baseURL = "https://rickandmortyapi.com/api"
    
    func getCharacters() async throws -> CharacterResponse {
        guard let url = URL(string: "\(baseURL)/character") else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...300) ~= httpResponse.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkError.invalidStatusCode(statusCode: statusCode)
        }
        
        let jsonDecoder = JSONDecoder()
        
        do {
            let results = try jsonDecoder.decode(CharacterResponse.self, from: data)
            return results
        } catch {
            throw NetworkError.failedToDecode(error: error)
        }
    }
}
