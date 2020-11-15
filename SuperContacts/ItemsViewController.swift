//
//  ItemsViewController.swift
//  SuperContacts
//
//  Created by Jillian Neff on 11/12/20.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection             section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.universe
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {(action) -> Void in
                self.itemStore.removeItem(item)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
        }
    }
    
    @IBAction func addNewItem(_ sender: UIButton){
        let newItem = itemStore.createItem()
        
        if let index = itemStore.allItems.firstIndex(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
        
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton){
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        }
        else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier {
        case "showItem"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
}
