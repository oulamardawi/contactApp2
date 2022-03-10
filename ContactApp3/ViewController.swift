//
//  ViewController.swift
//  ContactApp3
//
//  Created by Oula mardawi on 09/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var contactTableView: UITableView!
    
    let names = [
        "Joe Belfiore",
        "Bill Gates",
        "Mark Zuckerberg",
        "Masrissa Mayer",
        "Sundar Pichai",
        "Jeff Bezos"
      ]
    
    let titles = [
        "In a world far away",
        "What I'm doing here",
        "Really busy, WhatsApp only",
        "In a rush to catch a plane",
        "Do androids dream of electronic sheep?",
        "Counting zeros, Prime time",
      ]
    
    
    let contactsImages = [
        "joe",
        "bill",
        "mark",
        "marissa",
        "sudra",
        "jeff",
      ]
    
    let contactsNumbers = [
        "0599434233",
        "0599434566",
        "0599878699",
        "0599834211",
        "0568743329",
        "0569809923",
      ]

    override func viewDidLoad() {
        super.viewDidLoad()
        contactTableView.delegate = self
        contactTableView.dataSource = self
        contactTableView.separatorStyle = .none

        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
      
    
    //determine number of rows to show in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    //deaque and resuse the last cell with id(cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactImage = contactsImages[indexPath.row]
        let myCell = contactTableView.dequeueReusableCell(withIdentifier: "customCell") as! customCell
        
        myCell.nameLable.text = names[indexPath.row]
        myCell.titleLable.text = titles[indexPath.row]
        myCell.avatarImg.image = UIImage(named: contactImage)
//        myCell.avatarImg.layer.cornerRadius = (myCell.avatarImg.frame.size.width) / 2.2
//        myCell.avatarImg.clipsToBounds = true
//        myCell.avatarImg.layer.borderWidth = 2.5
//        myCell.avatarImg.layer.borderColor = grey.cgColor

        return myCell
    }
    

    //to determine the height of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
  

    //to handle the interaction with cell
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let contactImage = contactsImages[indexPath.row]
            if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewcontroller") as? SecondViewcontroller {
                vc.userName = names[indexPath.row]
                vc.img = UIImage(named:contactImage)!
                vc.userNumber = contactsNumbers[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
  
            }
      //      print("go to next page")
   }

}
