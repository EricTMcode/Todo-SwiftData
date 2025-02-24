//
//  AddTaskView.swift
//  Todo-SwiftData
//
//  Created by Eric on 24/02/2025.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    let category: TodoCategory
    @State private var title = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Task Title", text: $title)
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newTask = TodoTask(title: title)
                        category.tasks.append(newTask)
                        try? modelContext.save()
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

//#Preview {
//    AddTaskView()
//}
