//
//  TaskListView.swift
//  Todo-SwiftData
//
//  Created by Eric on 24/02/2025.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    let category: TodoCategory
    @Environment(\.modelContext) var modelContext
    @State private var showingAddTask = false

    var body: some View {
        List {
            ForEach(category.tasks) { task in
                HStack {
                    Button {
                        task.isCompleted.toggle()
                        try? modelContext.save()
                    } label: {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    }
                    Text(task.title)
                        .strikethrough(task.isCompleted)
                }
            }
            .onDelete(perform: deleteTasks)
        }
        .navigationTitle(category.title)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingAddTask = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddTask) {
//            AddTaskView(category: category)
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { category.tasks[$0] }.forEach(modelContext.delete)
            try? modelContext.save()
        }
    }
}

//#Preview {
//    TaskListView()
//}
