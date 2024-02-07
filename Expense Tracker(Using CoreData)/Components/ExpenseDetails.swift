//
//  ExpenseDetails.swift
//  Expense Tracker(Using CoreData)
//
//  Created by sabiq on 07/02/24.
//

import SwiftUI

struct ExpenseDetails: View {
    var amount : String
    var date   : Date
    var name   : String
    var type   : String
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 350, height: 75)
                .foregroundStyle(.white)
                .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
            HStack(spacing: 16){
                VStack(alignment: .leading,spacing: 4){
                    Text(name)
                        .foregroundStyle(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(type)
                        .foregroundStyle(.teal)
                        .font(.system(size: 15))
                        .bold()
                    Text(date,style: .date)
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                }
                .padding()
                Spacer()
                Text("$\(amount)")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.red)
                    .padding()
            }.padding(.horizontal,16)
        }
    }
}

#Preview {
    ExpenseDetails(amount: "200", date: Date(), name: "food", type: "food")
}
