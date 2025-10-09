//
//  Movie.swift
//  W05-Celin
//
//  Created by student on 09/10/25.
//
import Foundation

struct Movie: Identifiable, Codable, Hashable{
    var id = UUID()
    var title: String
    var genre: Genre // Linked Model
    var isFavourite: Bool = false
}
