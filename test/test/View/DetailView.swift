//
//  DetailView.swift
//  test
//
//  Created by Nirav.zalavadia on 04/02/26.
//

import SwiftUI

struct DetailView: View {
    let item: ItemModel
    var body: some View {
        Text("I am in detail of \(item.name) des \(item.description)")
    }
}

