//
//  ViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 09/03/2022.
//

import UIKit


class ViewController: UIViewController, AddContactDelegate {
    
    func handleButton(contact: Person) {
        contacts.append(contact)
        contactTableView.reloadData()
    }
    
    @IBOutlet var contactTableView: UITableView!
    
    @IBOutlet var floatingButton: UIButton!
    var contacts = [Person]()
    let customCell = "customCell"
    let SecondViewcontroller = "SecondViewcontroller"
    let RegisterViewcontroller = "RegisterViewcontroller"
    let imageBorderColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTab), for: .touchUpInside)
        configView()
        configData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    @IBAction func didTab(_ sender: Any) {
        if let vcc = storyboard?.instantiateViewController(withIdentifier: RegisterViewcontroller) as? AddContactViewController {
            vcc.delegate = self //self: a
            self.navigationController?.pushViewController(vcc, animated: true)
                }
    }
    

     
    
    func configView() {
        contactTableView.delegate = self
        contactTableView.dataSource = self
        contactTableView.separatorStyle = .none
       
        floatingButton.backgroundColor = .systemBlue
        let image = UIImage(systemName:"plus",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        floatingButton.setImage(image, for: .normal)
        floatingButton.tintColor = .white
        floatingButton.setTitleColor(.white, for: .normal)
        floatingButton.layer.shadowRadius = 20
        floatingButton.layer.shadowOpacity = 0.4
        floatingButton.layer.cornerRadius = 30
    }
    
    func configData() {
        contacts.append(Person(name: "Joe Belfiore", title: "In a world far away", number: "0599434233", Image: UIImage(named: "joe") ?? UIImage()))
        contacts.append(Person(name: "Bill Gates", title: "What I'm doing here", number: "0599434566", Image: UIImage(named: "bill") ?? UIImage()))
        contacts.append(Person(name: "Mark Zuckerberg", title: "Really busy, WhatsApp only", number: "0599878699", Image: UIImage(named: "mark") ?? UIImage()))
        contacts.append(Person(name: "Masrissa Mayer", title: "In a rush to catch a plane", number: "0599834211", Image: UIImage(named: "marissa") ?? UIImage()))
        contacts.append(Person(name: "Sundar Pichai", title: "Do androids dream of electronic sheep?", number: "0568743329", Image: UIImage(named: "sudra") ?? UIImage()))
        contacts.append(Person(name: "Jeff Bezos", title: "Counting zeros, Prime time", number: "0569809923", Image: UIImage(named: "jeff") ?? UIImage()))
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
        myCell.avatarImg.image = contactImage
        myCell.avatarImg.maskCircle()
        myCell.avatarImg.addImageBorder(color: imageBorderColor)
        
        return myCell
    }
    
    
    //to handlen ewsa` the interaction with cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactImage = contacts[indexPath.row].Image
        if let vc = storyboard?.instantiateViewController(withIdentifier: SecondViewcontroller) as? SecondViewController {
            vc.userName = contacts[indexPath.row].name
            vc.img = contactImage 
            vc.userNumber = contacts[indexPath.row].number
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

