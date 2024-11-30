//
//  TaskDetailView.swift
//  ToDoSwiftUI
//
//  Created by DAMII on 15/10/24.
//

import SwiftUI

struct TaskDetailView: View {
    @State var title: String
    @State var details: String
    @State var reminderDate: Date? // Manejaremos los opcionales
    @Environment(\.dismiss) var dismiss

    let onSave: (String, String, Date?) -> Void

    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Task Title", text: $title)
            }
            
            Section(header: Text("Details")) {
                TextEditor(text: $details)
                    .frame(height: 100)
            }
            
            Section(header: Text("Reminder")) {
                DatePicker("Set Reminder", selection: Binding(
                    get: { reminderDate ?? Date() },
                    set: { reminderDate = $0 }
                ), displayedComponents: [.date, .hourAndMinute])
            }
        }
        .navigationTitle("Task Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    onSave(title, details, reminderDate)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    TaskDetailView(
        title: "Sample Task",
        details: "This is a sample task description.",
        reminderDate: nil
    ) { _, _, _ in
        // Acción de ejemplo para guardar
    }
}
