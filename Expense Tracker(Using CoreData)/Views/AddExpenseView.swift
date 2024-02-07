//
//  AddExpenseView.swift
//  Expense Tracker(Using CoreData)
//
//  Created by sabiq on 06/02/24.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @AppStorage("darkMode") var isDarkModeEnabled = false
    @State private var name = ""
    @State private var amount = ""
    @State private var isExpenseAdded = false
    @State private var selectedCategory: String? = nil
    let categories = ["Food", "Housing", "Transport",
    "Entertainment", "Utilities"]
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
             TextField("Title of expense", text: $name)
                    .padding()
                    .foregroundStyle(.secondary)
                    .background(isDarkModeEnabled ? .black : .white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                TextField("Amount", text: $amount)
                       .padding()
                       .foregroundStyle(.secondary)
                       .background(isDarkModeEnabled ? .black : .white)
                       .cornerRadius(10)
                       .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                LazyVGrid(columns: [
                    GridItem(.flexible(),spacing: 16),
                    GridItem(.flexible(),spacing: 16),
                    GridItem(.flexible(),spacing: 16)
                    
                ],spacing: 16) {
                    ForEach(categories[0...2],id:\.self){ category in
                        Button(action: {
                            selectedCategory = category
                        }, label: {
                            Text(category)
                                .bold()
                                .padding(5)
                                .frame(maxWidth:.infinity,minHeight: 50)
                                .foregroundStyle(selectedCategory == category ? .white: .black)
                                .background(selectedCategory == category ? .blue : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 5,style: .continuous))
                                .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                                
                            
                        })
                    }
                }
                LazyVGrid(columns: [
                    GridItem(.flexible(),spacing: 16),
                    GridItem(.flexible(),spacing: 16),
                   
                    
                ],spacing: 16) {
                    ForEach(categories[3...4],id:\.self){ category in
                        Button(action: {
                            selectedCategory = category
                        }, label: {
                            Text(category)
                                .frame(maxWidth:.infinity,minHeight: 50)
                                .padding(5)
                                .bold()
                                .foregroundStyle(selectedCategory == category ? .white: .black)
                                .background(selectedCategory == category ? .blue : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                                
                                .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                               
                                
                            
                        })
                    }
                }
                
                Button (action:{
                    let expense = Expense(context: managedObjectContext)
                    expense.amount = Double(amount) ?? 0.0
                    expense.name = name
                    expense.date = Date()
                    expense.type = selectedCategory
                    expense.id = UUID()
                    do{
                        try managedObjectContext.save()
                        print("saved successfully")
                    }catch{
                        let nsError = error as NSError
                        fatalError("Unresolved error : \(nsError)")
                        
                    }
                    
                    isExpenseAdded = true

                } ,label: {
                    Text("Add Expenses")
                        .frame(maxWidth:.infinity,minHeight: 50)
                        .padding(5)
                        .bold()
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                        .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                    
                }).padding()
                
                
            }.padding(.horizontal)
                .preferredColorScheme(isDarkModeEnabled ? .dark : .light )
                .navigationTitle("Add Expenses")
                .alert("Expense Added", isPresented: $isExpenseAdded) {
                    Button {
                        isExpenseAdded = false
                        name = ""
                        amount = ""
                        selectedCategory = nil
                    } label: {
                        Text("OK")
                    }

                }
        }
    }
}

#Preview {
    AddExpenseView()
}
