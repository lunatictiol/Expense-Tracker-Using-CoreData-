//
//  DataController.swift
//  Expense Tracker(Using CoreData)
//
//  Created by sabiq on 06/02/24.
//

import Foundation
import CoreData
class DataController:ObservableObject{
    let container = NSPersistentContainer(name: "ExpenseTracker")
    
    init(){
        container.loadPersistentStores{description, error in
            if let error = error{
                print("failed to laod data in data controller :\(error.localizedDescription)")
            }
            
        }
    }
    
}
