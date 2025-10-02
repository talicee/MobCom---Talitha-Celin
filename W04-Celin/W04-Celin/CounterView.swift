//
//  CounterView.swift
//  W04-Celin
//
//  Created by student on 02/10/25.
//

import SwiftUI
struct CounterView: View{
    let movies: [Movie]
        @Binding var searchText: String   

        let columns = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
        ]
        
        var filteredMovies: [Movie] {
            if searchText.isEmpty {
                return movies
            } else {
                return movies.filter { movie in
                    movie.title.lowercased().contains(searchText.lowercased())
                }
            }
        }

        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(filteredMovies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieCard(movie: movie)
                        }
                    }
                }
                .padding()
            }
        }
}
