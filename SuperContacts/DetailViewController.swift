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
    
    var item: Item!
    
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
}
