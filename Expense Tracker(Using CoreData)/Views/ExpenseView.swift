//
//  ExpenseView.swift
//  Expense Tracker(Using CoreData)
//
//  Created by sabiq on 06/02/24.
//

import SwiftUI

struct ExpenseView: View {
    @AppStorage("darkMode") var isDarkModeEnabled = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
    var expenses: FetchedResults<Expense>
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical,showsIndicators: true){
                    VStack{
                        HStack{
                            Text("Welcome.")
                                .font(.title)
                            Spacer()
                        }
                        ForEach(expenses){ expense in
                            NavigationLink {
                                EditExpenseView(expense: expense)
                            } label: {
                                ExpenseDetails(amount: String(expense.amount), date: expense.date!, name: expense.name!, type: expense.type ?? "expense" )
                            }.contextMenu{
                                Button(action: {
                                    deleteExpense(expense: expense)
                        
                                }
                                       , label: {
                                    Label("delete", systemImage: "trash")
                                })
                            }

                        }
                    }
                }
            }.padding()
                .preferredColorScheme(isDarkModeEnabled ? .dark : .light )
                .navigationTitle("Expenses")
        }
    }
    
    func deleteExpense(expense:Expense){
        withAnimation{
            managedObjectContext.delete(expense)
            do{
                try managedObjectContext.save()
                print("saved successfully")
            }catch{
                let nsError = error as NSError
                fatalError("Unresolved error : \(nsError)")
                
            }
        }
    }
    
}

#Preview {
    ExpenseView()
}
