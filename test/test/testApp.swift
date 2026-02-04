//
//  testApp.swift
//  test
//
//  Created by Nirav.zalavadia on 04/02/26.
//

import SwiftUI

@main
struct testApp: App {
    let coordinator = ItemCoordinator()
    var body: some Scene {
        WindowGroup {
            coordinator.initialNavigation()
        }
    }
}
