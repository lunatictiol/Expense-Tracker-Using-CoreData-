//
//  ContentView.swift
//  Expense Tracker(Using CoreData)
//
//  Created by sabiq on 06/02/24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView{
            ExpenseView().tabItem {
                Image(systemName: "dollarsign")
                Text("Expenses")
                
            }
            AddExpenseView().tabItem {
                Image(systemName: "plus")
                Text("Add expenses")
            }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        }
    }
}

#Preview {
    MainView()
}
