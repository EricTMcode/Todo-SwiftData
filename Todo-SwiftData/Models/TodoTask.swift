//
//  TodoTask.swift
//  Todo-SwiftData
//
//  Created by Eric on 24/02/2025.
//

import SwiftUI
import SwiftData

@Model
class TodoTask {
    var title: String
    var isCompleted: Bool
    var category: TodoCategory?

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
