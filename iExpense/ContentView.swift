//
//  ContentView.swift
//  iExpense
//
//  Created by Yuki Shinohara on 2020/04/02.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    //    Remember, using @ObservedObject here asks SwiftUI to watch the object for any change announcements, so any time one of our @Published properties changes the view will refresh its body.
    @State private var showingAddExpense = false
    
    @State var isEditing = false
    
    var body: some View{
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    //                    Identifiableに準拠しているのでForeachに, id: \.idは不要
                    //                    Text(item.name)
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Group{
                            if item.amount <= 10 {
                                Text("$\(item.amount)").foregroundColor(.blue)
                            } else if item.amount <= 100 {
                                Text("$\(item.amount)").foregroundColor(.orange)
                            } else {
                                Text("$\(item.amount)").foregroundColor(.red)
                            }
                        }
                        
                    }
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationBarTitle("iExpense")
                //                leadingが先、trailingが後らしい
                .navigationBarItems(leading: EditButton(), trailing:
                    Button(action: {
                        self.showingAddExpense = true
                        //                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                        //                    self.expenses.items.append(expense)
                    }) {
                        Image(systemName: "plus")
                })
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: self.expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
