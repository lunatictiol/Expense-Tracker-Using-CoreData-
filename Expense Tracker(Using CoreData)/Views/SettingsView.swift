//
//  SettingsView.swift
//  Expense Tracker(Using CoreData)
//
//  Created by sabiq on 06/02/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("darkMode") var isDarkModeEnabled = false
    
    var body: some View {
        NavigationView{
            Form{
                Section("Appearance"){
                  Toggle("Dark mode", isOn: $isDarkModeEnabled)
                    
                }
                Section("About") {
                    Text("Expense tracker app using SwiftUI and CoreData")
                }
                
            }.navigationTitle("Settings")
                .preferredColorScheme(isDarkModeEnabled ? .dark : .light )
        }
        
    }
}

#Preview {
    SettingsView()
}
