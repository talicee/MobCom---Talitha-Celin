//
//  PokemonAPI.swift
//  W09 - Celinn
//
//  Created by student on 06/11/25.
//

import Foundation

enum PokemonAPI {
    private static let base = "https://pokeapi.co/api/v2"
    
    static func listURL(limit: Int, offset: Int) -> URL? {
        URL(string: "\(base)/pokemon?limit=\(limit)&offset=\(offset)")
    }
    
    static func detailURL(for nameOrID: String) -> URL? {
        URL(string: "\(base)/pokemon/\(nameOrID.lowercased())")
    }
}
