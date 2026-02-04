//
//  ItemRepository.swift
//  test
//
//  Created by Nirav.zalavadia on 04/02/26.
//

import Foundation

protocol NetworkdServiceContract {
    func fetchItemData() async -> [ItemModel]
}

class ItemRepository : NetworkdServiceContract {
    
    func fetchItemData() async -> [ItemModel]
    {
        // do actual network call and parsing
        return [ItemModel(id: UUID(), name: "first", description: "description"),
                ItemModel(id: UUID(),name: "second", description: "description")]
    }
}
