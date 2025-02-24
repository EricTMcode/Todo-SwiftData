//
//  TodoCategory.swift
//  Todo-SwiftData
//
//  Created by Eric on 24/02/2025.
//

import SwiftUI
import SwiftData

@Model
class TodoCategory {
    var title: String
    @Relationship(deleteRule: .cascade) var tasks: [TodoTask]

    init(title: String, tasks: [TodoTask] = []) {
        self.title = title
        self.tasks = tasks
    }
}
