//
//  UserSettings.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import Foundation

class UserSettings: ObservableObject {
  @Published var username = "Anonymous"
    
    init(username: String = "Anonymous") {
        self.username = username
    }
}
