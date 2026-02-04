//
//  FetchItemsUseCaseImpl.swift
//  test
//
//  Created by Nirav.zalavadia on 04/02/26.
//

// UseCase

import Foundation

protocol FetchItemsUseCase {
    func execute() async throws -> [ItemModel]
}

final class FetchItemsUseCaseImpl: FetchItemsUseCase {
    private let repository: ItemRepository

    init(repository: ItemRepository) {
        self.repository = repository
    }

    func execute() async throws -> [ItemModel] {
         await repository.fetchItemData()
    }
}

