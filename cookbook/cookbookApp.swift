//
//  cookbookApp.swift
//  cookbook
//
//  Created by laihj on 2023/9/15.
//

import SwiftUI

@main
struct cookbookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
