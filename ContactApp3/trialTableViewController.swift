//
//  trialTVC.swift
//  ContactApp3
//
//  Created by Oula mardawi on 24/03/2022.
import Foundation
import UIKit

class trialTableViewController: UITableViewController {

    let customTrial = "trial"
    @IBOutlet var trialTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
          configView()

    }
    

     func configView() {
        trialTableView.delegate = self
       trialTableView.dataSource = self
        trialTableView.separatorStyle = .none
   }
}




