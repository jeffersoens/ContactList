//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Вячеслав Горбатенко on 23.11.2022.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    // MARK: Private Properties
    
    private var names = DataStore.shared.names
    private var surnames = DataStore.shared.surnames
    private var contactList: [Contact] = []
    
    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        getContacts()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let contact = contactList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        
        cell.contentConfiguration = content
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactList[indexPath.row]
        performSegue(withIdentifier: "showContactDetails", sender: contact)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactDetailsVC = segue.destination as? ContactDetailsViewController else { return }
        contactDetailsVC.contact = sender as? Contact
    }

}

// MARK: Extensions

extension ContactListViewController {
    private func getContacts() {
        names.shuffle()
        surnames.shuffle()
        for _ in 1...names.count {
            let name = names.removeLast()
            let surname = surnames.removeLast()
            let newContact = Contact(name: name, surname: surname)
            contactList.append(newContact)
        }
    }
}
