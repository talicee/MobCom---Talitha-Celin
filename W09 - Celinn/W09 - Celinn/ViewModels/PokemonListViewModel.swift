//
//  PokemonListViewModel.swift
//  W09 - Celinn
//
//  Created by student on 06/11/25.
//

import Foundation
import Combine

@MainActor //view model ini akan running di main thread, kalo ada perubahan lgsg update
final class PokemonListViewModel: ObservableObject {
    @Published var items: [NamedAPIResource] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    
    private var canLoadMore = true
    private var offset = 0
    private var pageSize = 40
    
    //async : tetepa jalan secara individul (kek pas scroll gambar msh loading)
    func refresh() async{
        offset = 0
        canLoadMore = true
        items.removeAll()
        await loadMoreIfNeeded(force: true)
    }
    
    func loadMoreIfNeeded(currentItem item: NamedAPIResource? = nil, force: Bool = false) async {
        guard (force || shouldLoadMore(after: item)), !isLoading, canLoadMore else { return }
        await loadPage()
    }
    
    private func shouldLoadMore (after item: NamedAPIResource?) -> Bool {
        guard let item = item else {return true}
        guard let idx = items.firstIndex(where: {$0.id == item.id}) else {return false}
        return idx  >= items.count - 5 //near the bottom ->prefetch
    }
    
    private func loadPage() async {
        guard let url = PokemonAPI.listURL(limit: pageSize, offset: offset) else {
            errorMessage = APIError.badURL.localizedDescription
            return
        }
        isLoading = true; defer {isLoading = false}
        do{
            let page: PokemonListResponse = try await APIService.shared.fetch(url)
            items.append(contentsOf: page.results)
            canLoadMore = (page.next != nil)
            offset += pageSize
        } catch {
            if let apiErr = error as? APIError {
                errorMessage = apiErr.localizedDescription
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    var filteredItems: [NamedAPIResource]{
        let q = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !q.isEmpty else {return items}
        return items.filter{$0.name.contains(q)}
    }
}
