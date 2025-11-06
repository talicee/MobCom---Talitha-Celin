//
//  ContentView.swift
//  W09 - Celinn
//
//  Created by student on 06/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            PokemonListView()
                .navigationTitle(Text("PokéDex"))
        }
    }
}

#Preview {
    ContentView()
}
