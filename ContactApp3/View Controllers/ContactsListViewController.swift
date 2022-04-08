//
//  ViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 09/03/2022.
//

import UIKit


class ContactsListViewController: UIViewController {
    
    @IBOutlet var contactTableView: UITableView!
    @IBOutlet var floatingButton: UIButton!
    var viewModel: ContactsListViewModel!
    var viewModelContactListCell: ContactTableViewCellViewModel!
    let ContactCell = "ContactCell"
    let ContactDetailsViewcontroller = "ContactDetailsViewcontroller"
    let AddContactViewController = "AddContactViewController"
    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    var contact: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ContactsListViewModel()
        self.viewModelContactListCell = ContactTableViewCellViewModel()
        floatingButton.addTarget(self, action: #selector(didTab), for: .touchUpInside)
        configView()
    }
    
    
    @IBAction func didTab(_ sender: Any) {
        if let vcc = storyboard?.instantiateViewController(withIdentifier: AddContactViewController) as? AddContactViewController {
            vcc.delegate = self //self: a
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
    }
}

extension ContactsListViewController: UITableViewDelegate, UITableViewDataSource, AddContactDelegate {
    
    func handleButton(contact: Person) {
        viewModel.contacts.append(contact)
        contactTableView.reloadData()
    }
    
    
    //determine number of rows to show in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contacts.count
    }
    
    //deaque and resuse the last cell with id(cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < viewModel.contacts.count, let myCell = contactTableView.dequeueReusableCell(withIdentifier: ContactCell) as? ContactTableViewCell else { return UITableViewCell() }
        contact = viewModel.contacts[indexPath.row]
        myCell.config(contact: contact!)
           return myCell
    }
    
    //to handle interaction with cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: ContactDetailsViewcontroller) as? ContactDetailsViewController {
            let contactDetailsViewModel = ContactDetailsViewModel(contact:viewModel.contacts[indexPath.row])
        
            vc.viewModel = contactDetailsViewModel
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
}


