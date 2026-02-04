
protocol ItemService {
    func fetchItems() async throws -> [Item]
}

final class MockItemService: ItemService {
    func fetchItems() async throws -> [Item] {
        try await Task.sleep(nanoseconds: 500_000_000)
        return [
            Item(id: 1, title: "iPhone", description: "Apple smartphone"),
            Item(id: 2, title: "iPad", description: "Apple tablet"),
            Item(id: 3, title: "MacBook", description: "Apple laptop")
        ]
    }
}

final class ItemRepositoryImpl: ItemRepository {
    private let service: ItemService

    init(service: ItemService) {
        self.service = service
    }

    func fetchItems() async throws -> [Item] {
        try await service.fetchItems()
    }
}

// for Mock
let service = MockItemService()
let repository = ItemRepositoryImpl(service: service)
let useCase = FetchItemsUseCaseImpl(repository: repository)

View
 ↓
ViewModel
 ↓
UseCase
 ↓
Repository
 ↓
Network / Local
