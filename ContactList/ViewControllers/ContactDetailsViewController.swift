//
//  ContactDetailsViewController.swift
//  ContactList
//
//  Created by Вячеслав Горбатенко on 23.11.2022.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: Public properties
    
    var contact: Contact!
    
    // MARK: Override methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = contact.fullName

        phoneNumberLabel.text = contact.phoneNumber
        emailLabel.text = contact.email
    }

}
