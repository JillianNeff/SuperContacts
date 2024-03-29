//
//  DetailViewController.swift
//  SuperContacts
//
//  Created by Jillian Neff on 11/14/20.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var universeField: UITextField!
    @IBOutlet var alignmentField: UITextField!
    @IBOutlet var strengthsField: UITextField!
    @IBOutlet var weaknessesField: UITextField!
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        universeField.text = item.universe
        alignmentField.text = item.alignment
        strengthsField.text = item.strengths
        weaknessesField.text = item.weaknesses
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        item.name = nameField.text ?? ""
        item.universe = universeField.text ?? ""
        item.alignment = alignmentField.text ?? ""
        item.strengths = strengthsField.text ?? ""
        item.weaknesses = weaknessesField.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func deleteContact(_ sender: UIBarItem) {
        let title = "Delete \(item.name)?"
        let message = "Are you sure you want to delete this item?"
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {(action) -> Void in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let itemStore = appDelegate.itemStore
            itemStore.removeItem(self.item)
        })
        
        ac.addAction(deleteAction)
        
        present(ac, animated: true, completion: nil)
        
    }
    
    
}
