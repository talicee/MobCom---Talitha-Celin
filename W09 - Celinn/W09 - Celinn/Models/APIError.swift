//
//  APIError.swift
//  W09 - Celinn
//
//  Created by student on 06/11/25.
//

import Foundation

enum APIError: LocalizedError{
    case badURL
    case network(underlying: Error)
    case server(status: Int)
    case decoding(underlying: Error)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badURL: return "Invalid URL."
        case .network(let e): return "Network error: \(e.localizedDescription)"
        case .server(let s): return "Server error (status \(s))."
        case .decoding(let e): return "Failed to decode response: \(e.localizedDescription)"
        case .unknown: return "Unknown error."
        }
    }
}
