//
//  PokemonDetailView.swift
//  w09
//
//  Created by student on 06/11/25.
//

import SwiftUI

struct PokemonDetailView: View {
    let nameOrID: String
    let titleName: String
    let artworkURL: URL?
    
    @StateObject private var vm = PokemonDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: artworkURL) { img in
                    img
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 260, maxHeight: 260)
                        .padding(.top, 12)
                } placeholder: {
                    ProgressView().frame(height: 200)
                }
                
                if vm.isLoading {
                    ProgressView("Loading details…")
                } else if let err = vm.errorMessage {
                    Text(err).foregroundStyle(.red).multilineTextAlignment(.center)
                    Button("Retry") { Task { await vm.load(nameOrID: nameOrID) } }
                } else if let d = vm.detail {
                    detailCard(d)
                }
            }
            .padding()
        }
        .navigationTitle(titleName)
        .navigationBarTitleDisplayMode(.inline)
        .task { await vm.load(nameOrID: nameOrID) }
    }
    
    @ViewBuilder
    private func detailCard(_ d: PokemonDetail) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                badge("ID #\(d.id)")
                badge("Height \(d.height)")
                badge("Weight \(d.weight)")
            }
            .lineLimit(1)
            .minimumScaleFactor(0.8)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Types").font(.headline)
                WrapHStack(d.types.map { $0.type.name.capitalized })
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Abilities").font(.headline)
                WrapHStack(d.abilities.map { a in
                    a.is_hidden ? "\(a.ability.name.capitalized) (Hidden)" : a.ability.name.capitalized
                })
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Base Stats").font(.headline)
                ForEach(d.stats) { s in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(s.stat.name.capitalized)
                            Spacer()
                            Text("\(s.base_stat)")
                        }
                        ProgressView(value: Double(s.base_stat), total: 255)
                    }
                }
            }
        }
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
    
    private func badge(_ text: String) -> some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 8).padding(.vertical, 4)
            .background(Color(.systemGray6), in: Capsule())
    }
}

/// Simple wrapping HStack for chips
struct WrapHStack: View {
    let items: [String]
    let spacing: CGFloat = 8
    let vSpacing: CGFloat = 8
    
    init(_ items: [String]) { self.items = items }
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(items, id: \.self) { item in
                chip(item)
                    .alignmentGuide(.leading) { d in
                        if (abs(width - d.width) > UIScreen.main.bounds.width - 32) {
                            width = 0
                            height -= d.height + vSpacing
                        }
                        let result = width
                        if item == items.last {
                            width = 0
                        } else {
                            width -= d.width + spacing
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        if item == items.last {
                            height = 0
                        }
                        return result
                    }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func chip(_ text: String) -> some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 10).padding(.vertical, 6)
            .background(Color(.systemGray5), in: Capsule())
    }
}






