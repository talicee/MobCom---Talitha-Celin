//
//  PokemonDetailViewModel.swift
//  W09 - Celinn
//
//  Created by student on 06/11/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class PokemonDetailViewModel: ObservableObject {
    @Published var detail: PokemonDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func load(nameOrID: String) async {
        guard let url = PokemonAPI.detailURL(for: nameOrID) else {
            errorMessage = APIError.badURL.localizedDescription
            return
        }
        isLoading = true; defer {isLoading = false}
        do{
            detail = try await APIService.shared.fetch(url)
        } catch {
            if let apiErr = error as? APIError {
                errorMessage = apiErr.localizedDescription
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
}
