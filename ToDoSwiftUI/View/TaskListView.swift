//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by DAMII on 15/10/24.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    NavigationLink(destination: TaskDetailView(
                        title: task.title ?? "",
                        details: task.details ?? "",
                        reminderDate: task.reminderDate
                    ) { newTitle, newDetails, newReminderDate in
                        viewModel.updateTask(task: task, newTitle: newTitle, newDetails: newDetails, newReminderDate: newReminderDate)
                    }) {
                        VStack(alignment: .leading) {
                            Text(task.title ?? "No Title")
                                .font(.headline)
                            if let reminder = task.reminderDate {
                                Text("Reminder: \(reminder, formatter: DateFormatter.shortDateTimeFormatter)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { viewModel.deleteTask(task: viewModel.tasks[$0]) }
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: TaskDetailView(
                        title: "",
                        details: "",
                        reminderDate: nil
                    ) { title, details, reminderDate in
                        viewModel.addTask(title: title, details: details, reminderDate: reminderDate)
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

extension DateFormatter {
    static var shortDateTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}

#Preview {
    TaskListView()
}
