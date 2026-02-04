//
//  ItemView.swift
//  test
//
//  Created by Nirav.zalavadia on 04/02/26.
//

import SwiftUI

struct ItemListView: View {

    @StateObject var viewModel: ItemViewModel
    @ObservedObject var coordinator: ItemCoordinator

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Items")
                .navigationDestination(isPresented: $coordinator.isDetailActive) {
                    if let item = coordinator.selectedItem {
                        DetailView(item: item)
                    }
                }
                .onAppear {
                    viewModel.loadItems()
                }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView()

        case .loaded(let items):
            List(items) { item in
                Text(item.name)
                    .onTapGesture {
                        viewModel.onItemTappe(item: item)
                    }
            }

        case .error(let message):
            Text(message)
                .foregroundColor(.red)
        }
    }
}

