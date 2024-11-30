//
//  UNUserNotificationCenter.swift
//  ToDoSwiftUI
//
//  Created by DAMII on 30/11/24.
//

import Foundation
import UserNotifications

UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
    if let error = error {
        print("Error requesting notifications permission: \(error)")
    }
}

