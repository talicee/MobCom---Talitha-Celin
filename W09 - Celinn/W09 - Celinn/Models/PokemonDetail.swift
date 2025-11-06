//
//  PokemonDetail.swift
//  W09 - Celinn
//
//  Created by student on 06/11/25.
//

import Foundation

struct PokemonDetail: Codable, Identifiable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [TypeSlot]
    let abilities: [AbilitySlot]
    let stats: [Stat]
    
    struct TypeSlot: Codable {
        let type: NamedType
        struct NamedType: Codable {let name: String}
    }
    
    struct AbilitySlot: Codable {
        let is_hidden: Bool
        let slot: Int
        let ability: NamedAbility
        struct NamedAbility: Codable {let name: String}
    }
    
    struct Stat: Codable, Identifiable {
        let base_stat: Int
        let effort: Int
        let stat: NamedStat
        var id: String {stat.name}
        struct NamedStat: Codable {let name: String}
    }
}
