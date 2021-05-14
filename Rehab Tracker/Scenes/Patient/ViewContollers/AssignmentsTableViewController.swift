//
//  AssignmentsTableViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 10.05.2021.
//

import UIKit

class AssignmentsTableViewController: UITableViewController {
    
    let assignmentCell = "assignmentCell"

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: assignmentCell, for: indexPath)

        cell.textLabel?.text = "Week 1"
        cell.detailTextLabel?.text = "Doctor Name"

        return cell
    }


}
