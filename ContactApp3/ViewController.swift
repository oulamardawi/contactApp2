//
//  ViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 09/03/2022.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var contactTableView: UITableView!
    
    var contacts = [Person]()
    let customCell = "customCell"
    let SecondViewcontroller = "SecondViewcontroller"
    let RegisterViewcontroller = "RegisterViewcontroller"
    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        configView()
        configData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(
            x: view.frame.size.width - 70,
            y: view.frame.size.height - 100,
            width: 60,
            height: 60)
    }
    
    @objc private func didTapButton() {
        if let vcc = storyboard?.instantiateViewController(withIdentifier: RegisterViewcontroller) as? RegisterViewController {
            self.navigationController?.pushViewController(vcc, animated: true)
                }
    }
    
    
    func configView() {
        contactTableView.delegate = self
        contactTableView.dataSource = self
        contactTableView.separatorStyle = .none
    }
    
    func configData() {
        contacts.append(Person(name: "Joe Belfiore", title: "In a world far away", number: "0599434233", Image: "joe"))
        contacts.append(Person(name: "Bill Gates", title: "What I'm doing here", number: "0599434566", Image: "bill"))
        contacts.append(Person(name: "Mark Zuckerberg", title: "Really busy, WhatsApp only", number: "0599878699", Image: "mark"))
        contacts.append(Person(name: "Masrissa Mayer", title: "In a rush to catch a plane", number: "0599834211", Image: "marissa"))
        contacts.append(Person(name: "Sundar Pichai", title: "Do androids dream of electronic sheep?", number: "0568743329", Image: "sudra"))
        contacts.append(Person(name: "Jeff Bezos", title: "Counting zeros, Prime time", number: "0569809923", Image: "jeff"))
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //determine number of rows to show in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    //deaque and resuse the last cell with id(cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactImage = contacts[indexPath.row].Image
        let myCell = contactTableView.dequeueReusableCell(withIdentifier: customCell) as! customCell
        
        myCell.nameLable.text = contacts[indexPath.row].name
        myCell.titleLable.text = contacts[indexPath.row].title
        myCell.avatarImg.image = UIImage(named: contactImage)
        myCell.avatarImg.maskCircle()
        myCell.avatarImg.addImageBorder(color: imageBorderColor)
        
        return myCell
    }
    
    
    //to handlen ewsa` the interaction with cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactImage = contacts[indexPath.row].Image
        if let vc = storyboard?.instantiateViewController(withIdentifier: SecondViewcontroller) as? SecondViewController {
            vc.userName = contacts[indexPath.row].name
            vc.img = UIImage(named:contactImage) ?? UIImage()
            vc.userNumber = contacts[indexPath.row].number
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

