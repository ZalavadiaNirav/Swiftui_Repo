//
//  ItemCoordinator.swift
//  test
//
//  Created by Nirav.zalavadia on 04/02/26.
//

import Foundation
import SwiftUI
internal import Combine

class ItemCoordinator: ObservableObject, ItemNavigation {
    
    @Published var selectedItem: ItemModel?
    @Published var isDetailActive = false

    func initialNavigation() -> ItemListView
    {
        let repository = ItemRepository()
        let useCase = FetchItemsUseCaseImpl(repository: repository)
        let itemVM = ItemViewModel(fetchItemsUseCase: useCase, navigation:self)
        return ItemListView(viewModel:itemVM, coordinator:self)
    }
    
    func showItemDetail(item: ItemModel) {
        selectedItem = item
        isDetailActive = true
    }
}
