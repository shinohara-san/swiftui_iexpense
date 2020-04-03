//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Yuki Shinohara on 2020/04/03.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    //    let id: UUID
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    //    @Published var items = [ExpenseItem]()
    @Published var items: [ExpenseItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                //                 unarchiving the Data object into an array of ExpenseItem objects.
                //                To avoid confusion – to say that we mean we’re referring to the type itself, known as the type object – we write .self after it.
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

//That finishes all the data required for our main view: we have a struct to represent a single item of expense, and a class to store an array of all those items.
