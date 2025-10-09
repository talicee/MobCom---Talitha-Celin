//
//  MovieViewModel.swift
//  W05-Celin
//
//  Created by student on 09/10/25.
//

import Foundation
import SwiftUI
import Observation

@Observable
final class MovieViewModel{
    var movies: [Movie] = []
    private let key =  "movies.store.v1"
    
    init(){
        load()
    }
    
    func toggleFavorite(_ movie: Movie){
        if let i = movies.firstIndex(where: {$0.id == movie.id}){
            movies[i].isFavourite.toggle()
        }
    }
    
    func addMovie(title: String, genre: Genre){
        let clean = title.trimmingCharacters(in: .whitespacesAndNewlines)
        if clean.isEmpty {return}
        movies.append(Movie(title: clean, genre: genre))
    }
    
    func save(){
        if let data = try? JSONEncoder().encode(movies){
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func load(){
        if let data = UserDefaults.standard.data(forKey: key), //userdefault menyimpan datamu di aplikasi ini dg struktur JSON
           let decoded = try? JSONDecoder().decode([Movie].self, from: data){
            movies = decoded
        } else {
            let g = Genre.all
            movies = [
                Movie(title: "The Incredibles" ,genre: g[0]),
                Movie(title: "Shrek 2" ,genre: g[1], isFavourite: true),
                Movie(title: "HAI" ,genre: g[0]),
            ]
            save()
        }
    }
    
    var favourites: [Movie]{
        movies.filter{$0.isFavourite}
    }
}
