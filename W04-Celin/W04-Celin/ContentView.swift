//
//  ContentView.swift
//  W04-Celin
//
//  Created by student on 02/10/25.
//

import SwiftUI
import Combine

class MovieStore: ObservableObject {
    @Published var movies: [Movie] = Movie.samples
}

struct ContentView: View {
    @State private var searchText: String = ""
    @StateObject private var store = MovieStore()
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("UCFlix 🎥")
                        .font(.largeTitle.bold())
                        .padding(.top, 20)
                        .padding(.trailing, 150)
                }
                
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(width: 340, height: 50)
                
                ScrollView{
                    CounterView(movies: store.movies, searchText: $searchText)
                }
                
            }
        }

    }
}

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                AsyncImage(url: URL(string: movie.posterURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 140)
                        .clipped()
                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                } placeholder: {
                    ProgressView()
                }
                .padding(4)
                
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(movie.genre)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            .frame(width: 100)
               
        }
    }
}
    

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: movie.posterURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 5)

                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 7)
                            )
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 400)
                
                VStack{
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Directed by \(movie.director)")
                        .font(.subheadline)
                        .padding(.top, 3)
                }
                
                HStack{
                    Text(movie.genre)
                        .font(.body)
                        .foregroundColor(.gray)
                    Divider()
                    Text("Duration: \(movie.duration)")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                                       .fill(.black)
                                       .shadow(radius: 20)
                                       .frame(width: 250, height: 35)
                        
                        Text("WATCH NOW")
                            .foregroundColor(.white)
                            .font(.headline.bold())
                    }

                    
                    Text(movie.desc)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .italic()
                        .frame(width: 300, height: 100)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)   // allow full text
                        .padding(.top,5)
                }
            }
            .padding()
        }
        .navigationTitle(movie.title)
    }
}
    
    
struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let director: String
    let genre: String
    let duration: String
    let posterURL: String
    let desc: String
    
    static let samples: [Movie] = [
        Movie(
            title: "Alita: Battle Angel",
            director: "Robert Rodriguez",
            genre: "Action, Adventure",
            duration: "122 min",
            posterURL: "https://m.media-amazon.com/images/M/MV5BYmZhZGQzM2MtMWEyZC00YTU1LTk4YTQtMTg3ZjEzM2U1NTkxXkEyXkFqcGc@._V1_.jpg",
            desc:"In a cyberpunk future, a scientist discovers a mysterious cyborg girl with no memory of her past. As Alita learns who she really is, she fights powerful enemies in a world filled with corruption and high-tech battles.",
        ),
        Movie(
            title: "Inception",
            director: "Christopher Nolan",
            genre: "Action, Sci-Fi",
            duration: "148 min",
            posterURL: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX1000_.jpg",
            desc:"A skilled thief who can enter people’s dreams is tasked with planting an idea in someone’s mind. To succeed, he and his team must dive deep into layered dream worlds while facing danger from his own subconscious."
        ),
        Movie(
            title: "Interstellar",
            director: "Christopher Nolan",
            genre: "Adventure, Drama",
            duration: "169 min",
            posterURL: "https://m.media-amazon.com/images/I/91kFYg4fX3L._AC_SL1500_.jpg",
            desc:"In a future where Earth is dying, a group of astronauts travels through a wormhole to find a new home for humanity. Along the journey, they face the mysteries of space, time, and the strength of human love."
        ),
        Movie(
            title: "Avatar",
            director: "James Cameron",
            genre: "Action, Adventure, Fantasy",
            duration: "162 min",
            posterURL: "https://upload.wikimedia.org/wikipedia/id/b/b0/Avatar-Teaser-Poster.jpg",
            desc: "On the lush alien world of Pandora, a paraplegic Marine is sent to participate in the Avatar Program. As he gains the trust of the native Na'vi, he faces the choice between following orders or protecting the world he has grown to love."
        ),
        Movie(
            title: "Loki",
            director: "Kate Herron",
            genre: "Action, Fantasy, Sci-Fi",
            duration: "45 min per episode",
            posterURL: "https://cdn.marvel.com/content/1x/online_9.jpg",
            desc: "After stealing the Tesseract during the events of Avengers: Endgame, Loki finds himself working with the Time Variance Authority to fix the timeline and prevent chaos across the multiverse."
        ),
    ]
    
}
    
    #Preview {
        ContentView()
    }
    
