//
//  Extensions.swift
//  ToDoSwiftUI
//
//  Created by DAMII on 30/11/24.
//

import Foundation

extension DateFormatter {
    static var shortDateTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}

