//
//  ItemViewModel.swift
//  test
//
//  Created by Nirav.zalavadia on 04/02/26.
//

import Foundation
internal import Combine

protocol ItemNavigation {
    func showItemDetail(item: ItemModel)
}

class ItemViewModel : ObservableObject
{
    enum ViewState {
        case idle
        case loading
        case loaded([ItemModel])
        case error(String)
    }

    @Published private(set) var state: ViewState = .idle
    private let fetchItemsUseCase: FetchItemsUseCase
    private let navigation: ItemNavigation
    
    init(fetchItemsUseCase: FetchItemsUseCase,navigation: ItemNavigation) {
        self.fetchItemsUseCase = fetchItemsUseCase
        self.navigation = navigation
    }
    
    func onItemTappe(item: ItemModel) {
        self.navigation.showItemDetail(item: item)
    }
    
    func loadItems() {
        state = .loading
        Task {
            do {
                let items = try await fetchItemsUseCase.execute()
                state = .loaded(items)
            } catch {
                state = .error("Failed to load items")
            }
        }
    }
}
