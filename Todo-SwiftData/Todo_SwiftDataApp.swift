//
//  Todo_SwiftDataApp.swift
//  Todo-SwiftData
//
//  Created by Eric on 24/02/2025.
//

import SwiftUI
import SwiftData

@main
struct Todo_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [TodoCategory.self, TodoTask.self])
    }
}
