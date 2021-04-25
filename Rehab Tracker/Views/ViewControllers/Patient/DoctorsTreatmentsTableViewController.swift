//
//  DoctorsTreatmentsTableViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 24.04.2021.
//

import UIKit

class DoctorsTreatmentsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorsTreatmentsCell", for: indexPath)
        
        cell.textLabel?.text = "doctor name"
        cell.detailTextLabel?.text = "treatment status"
        
        //nothing else needed for this page

        return cell
    }
}
