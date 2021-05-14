//
//  SessionViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 14.05.2021.
//

import UIKit

class SessionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sessionTextField: UITextField!
    
    var defaults = UserDefaults.standard
    var userID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(endSession))]
        
        userID = defaults.string(forKey: currentUser)
    }
    
    @objc func endSession() {
        navigationController?.popToRootViewController(animated: true)
     }
    
    @IBAction func sendButton(_ sender: Any) {
    }
    
    func checkUser() {
        
    }
    
}

extension SessionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sessionCell", for: indexPath)
        cell.textLabel?.text = "deneme"
        return cell
    }
}
