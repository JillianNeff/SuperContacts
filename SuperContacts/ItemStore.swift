//
//  ItemStore.swift
//  SuperContacts
//
//  Created by Jillian Neff on 11/12/20.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    init() {
        for _ in 0..<12 {
            createItem()
        }
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item){
            allItems.remove(at: index)
        }
    }
}
