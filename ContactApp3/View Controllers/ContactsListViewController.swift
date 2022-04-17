//
//  ViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 09/03/2022.

import UIKit


class ContactsListViewController: UIViewController {
    
    @IBOutlet var contactTableView: UITableView!
    @IBOutlet var floatingButton: UIButton!
    @IBOutlet var EmptyView: UIView!
    var viewModel: ContactsListViewModel!
    let contactCell = "ContactCell"
    let contactDetailsViewController = "ContactDetailsViewcontroller"
    let addContactViewController = "AddContactViewcontroller"
    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ContactsListViewModel()
        floatingButton.addTarget(self, action: #selector(didTab), for: .touchUpInside)
        configView()
        
    }
    
    @IBAction func didTab(_ sender: Any) {
        if let vcc = storyboard?.instantiateViewController(withIdentifier: addContactViewController) as? AddContactViewController {
            vcc.delegate = self //it says that delegate in addContactsVC(vcc) is point to ContactsListVC
            self.navigationController?.pushViewController(vcc, animated: true)
        }
    }
    
    func configView() {
        contactTableView.delegate = self
        contactTableView.dataSource = self
        contactTableView.separatorStyle = .none
        
        floatingButton.backgroundColor = .systemBlue
        let image = UIImage(systemName: "plus",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        floatingButton.setImage(image, for: .normal)
        floatingButton.tintColor = .white
        floatingButton.setTitleColor(.white, for: .normal)
        floatingButton.layer.shadowRadius = 20
        floatingButton.layer.shadowOpacity = 0.3
        floatingButton.layer.cornerRadius = 30
        isEmptyView()
    }
}

extension ContactsListViewController: UITableViewDelegate, UITableViewDataSource, AddContactDelegate {
   
    func handleButton(contact: Contact) {
        DataBaseManager.addNewContact(contact: contact)
        viewModel.refresh()
        self.contactTableView.reloadData()
        isEmptyView()
    }
    
    func isEmptyView() {
        if viewModel.contacts.count == 0 {
            contactTableView.backgroundView = EmptyView
        }
        else {
            contactTableView.backgroundView = nil
        }
    }
    
    //determine number of rows to show in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contacts.count
    }
    
    //deaque and resuse the last cell with id(cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < viewModel.contacts.count, let myCell = contactTableView.dequeueReusableCell(withIdentifier: contactCell) as? ContactTableViewCell else { return UITableViewCell() }
        myCell.config(contact: viewModel.contacts[indexPath.row])
        return myCell
    }
    
    //to handle interaction with cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: contactDetailsViewController) as? ContactDetailsViewController {
            let contactDetailsViewModel = ContactDetailsViewModel(contact: viewModel.contacts[indexPath.row])
            vc.viewModel = contactDetailsViewModel
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Creat swipe action
        let action: UIContextualAction
        action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            
            //which person to remove
            let personToRemove = self.viewModel.contacts[indexPath.row]
            DataBaseManager.deleteContact(person: personToRemove)
            self.viewModel.contacts.remove(at: indexPath.row)
            self.contactTableView.deleteRows(at: [indexPath], with: .fade)
            self.contactTableView.reloadData()
            completion(true)
        }
        action.backgroundColor = .red
        isEmptyView()
        return UISwipeActionsConfiguration(actions: [action])
        
    }
}

