//
//  Expense_Tracker_Using_CoreData_App.swift
//  Expense Tracker(Using CoreData)
//
//  Created by sabiq on 06/02/24.
//

import SwiftUI

@main
struct Expense_Tracker_Using_CoreData_App: App {
    @StateObject private var datacontroller = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, datacontroller.container.viewContext)
        }
    }
}
