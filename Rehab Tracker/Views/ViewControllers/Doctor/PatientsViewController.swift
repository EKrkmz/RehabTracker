//
//  PatientsViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 25.04.2021.
//

import UIKit

class PatientsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    } 

}

extension PatientsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "patientsTableViewCell", for: indexPath)
        cell.textLabel?.text = "patient name"
        
        return cell
        
    }
    
}
