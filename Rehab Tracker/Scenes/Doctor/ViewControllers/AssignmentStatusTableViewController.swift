//
//  AssignmentStatusTableViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 25.04.2021.
//

import UIKit

class AssignmentStatusTableViewController: UITableViewController {
    
    var assignmentList: [Assignment] = []
    private let defaults = UserDefaults.standard
    var doctorID: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        doctorID = defaults.string(forKey: currentDoctorID)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getAssignments()
    }
    
    func getAssignments() {
        AssignmentManager.shared.downloadAssignmentsFromFirebase { (allAssignments) in
            for assignment in allAssignments {
                if assignment.assignmentDoctorID == self.doctorID {
                    self.assignmentList.append(assignment)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Navigation
    func showStatus(index: Int) {
        let storyboard = UIStoryboard(name: "Doctor", bundle: nil)
        guard let statusVC = storyboard.instantiateViewController(identifier: "statusVC") as? StatusViewController else {
            return
        }
        statusVC.assignment = assignmentList[index]
        show(statusVC, sender: nil)
    }

    // MARK: - Table view data source & delegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignmentList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "assignmentStatusTableViewCell", for: indexPath)
        let assigment = assignmentList[indexPath.row]
        
        if assigment.assignmentStatus {
            cell.textLabel?.text = "DONE"
            cell.textLabel?.textColor = .green
            
        } else {
            cell.textLabel?.text = "NOT DONE"
            cell.textLabel?.textColor = .darkGray
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showStatus(index: indexPath.row)
    }
}
