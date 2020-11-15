//
//  DetailViewController.swift
//  SuperContacts
//
//  Created by Jillian Neff on 11/14/20.
//

import UIKit

class DetailViewController: UIViewController {
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
    
}
