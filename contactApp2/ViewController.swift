//
//  ViewController.swift
//  contactApp2
//
//  Created by Oula mardawi on 08/03/2022.
//

import UIKit


class ViewController: UIViewController{
    
    
    @IBOutlet var TableView: UITableView!
    
    let names = [
        "Joe Belfiore",
        "Bill Gates",
        "Mark Zuckerberg",
        "Masrissa Mayer",
        "Sundar Pichai",
        "Jeff Bezos",
        "Oula Mardawi",
  ]
    
    var logoImages: [UIImage] = []

    
    
//    var logoImage: [UIImage] = [
//        UIImage(named: "billgates.jpeg")!,
//        UIImage(named: "jeffbezos.jpeg")!,
//        UIImage(named: "markzuckerberg.jpeg")!,
//        UIImage(named: "masrissamayer.jpeg")!,
//        UIImage(named: "sundarpichai.jpeg")!,
//        UIImage(named: "joebelfiore.jpeg")!,
//        UIImage(named: "jeffbezos.jpeg")!,
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    //determine number of rows to show in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    //deaque and resuse the last cell with id(cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       myCell.textLabel?.text = names[indexPath.row]
        myCell.imageView?.layer.cornerRadius = (myCell.imageView?.frame.size.width)! / 0.7
        myCell.imageView?.clipsToBounds = true
        return myCell
    }
    

    //to determine the height of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
  

    //to handle the interaction with cell
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("go to next page")
   }

}
