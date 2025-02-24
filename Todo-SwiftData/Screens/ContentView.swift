//
//  ContentView.swift
//  Todo-SwiftData
//
//  Created by Eric on 24/02/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var categories: [TodoCategory]

    @State private var showingAddCategory = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { category in
                    NavigationLink {
                        TaskListView(category: category)
                    } label: {
                        Text(category.title)
                    }
                }
                .onDelete(perform: deleteCategories)
            }
            .navigationTitle("Todo Categories")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddCategory = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddCategory) {
//                AddCategoryView()
            }
        }
    }

    private func deleteCategories(offsets: IndexSet) {
        withAnimation {
            offsets.map { categories[$0] }.forEach(modelContext.delete)
            try? modelContext.save()
        }
    }
}

#Preview {
    ContentView()
}
