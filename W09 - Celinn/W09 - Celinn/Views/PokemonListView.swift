//
//  PokemonListView.swift
//  W09 - Celinn
//
//  Created by student on 06/11/25.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject private var vm = PokemonListViewModel()
    
    var body: some View {
        List{
            Section {
                if vm.filteredItems.isEmpty && vm.isLoading{
                    ProgressView("Loading Pokemon...")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                ForEach(vm.filteredItems) {item in
                    NavigationLink {
                        PokemonDetailView(nameOrID: item.name,
                                          titleName: item.name.capitalized,
                                          artworkURL: item.artworkURL)
                    } label : {
                        HStack(spacing: 12) {
                            AsyncImage(url: item.artworkURL) {img in
                                img
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                            } placeholder: {
                                ProgressView().frame(width: 48, height: 48)
                            }
                            Text(item.name.capitalized)
                                .font(.body)
                        }
                        .task {
                            //infinite scroll trigger
                            await vm.loadMoreIfNeeded(currentItem: item)
                        }
                    }
                }
                
                if vm.isLoading {
                    HStack{
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                } else if let err = vm.errorMessage {
                    VStack (spacing: 8) {
                        Text(err)
                            .foregroundColor(.red)
                        Button("Retry") {Task {await
                            vm.loadMoreIfNeeded(force: true)}}
                    }
                    .frame(maxWidth: .infinity)
                } else if !vm.isLoading && !vm.filteredItems.isEmpty {
                    //optional footer whennot loading
                    EmptyView()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task{await vm.refresh()}
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
                .disabled(vm.isLoading)
                .help("Refresh")
            }
        }
        .searchable(text: $vm.searchText, prompt: "Search Pokemon")
        .task {await vm.refresh()}
    }
}

#Preview {
    PokemonListView()
}
