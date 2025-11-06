//
//  PokemonListResponse.swift
//  W09 - Celinn
//
//  Created by student on 06/11/25.
//

import Foundation

struct PokemonListResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [NamedAPIResource]
}

struct NamedAPIResource: Codable, Identifiable{
    let name: String
    let url: String
    
    var id: String { name }
    
    var numericID : Int?{
        let comps = url.split(separator: "/").compactMap{Int($0)}
        return comps.last
    }
    
    var artworkURL: URL? {
        guard let id = numericID else {return nil}
        return URL(string:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
        )
    }
    
    
    
}
