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
                .environmentObject(UserSettings(username: "name1"))
                .environmentObject(UserSettings(username: "name2"))
            //看看去是用类型来指定了，那如果我给了同一类型的两个实例呢？
            //有没有办法指定？
        }
    }
}
