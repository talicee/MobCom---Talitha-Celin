//
//  APIService.swift
//  W09 - Celinn
//
//  Created by student on 06/11/25.
//

import Foundation

final class APIService {
    static let shared = APIService()
    private init() {}
    
    func fetch<T: Decodable>(_ url: URL) async throws -> T {
        do {
            let (data, resp) = try await URLSession.shared.data(from: url)
            if let http = resp as? HTTPURLResponse,
               !(200...299).contains(http.statusCode){
                throw APIError.server(status: http.statusCode)
            }
            
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw APIError.decoding(underlying: error)
            }
        } catch {
            throw APIError.network(underlying: error)
        }
    }
}
