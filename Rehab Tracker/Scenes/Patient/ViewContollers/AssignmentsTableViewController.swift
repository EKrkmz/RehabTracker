//
//  AssignmentsTableViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 10.05.2021.
//

import UIKit

class AssignmentsTableViewController: UITableViewController {
    
    let assignmentCell = "assignmentCell"
    private let defaults = UserDefaults.standard
    var patientID: String?
    var assignmentList: [Assignment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        patientID = defaults.string(forKey: currentPatientID)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getAssignments()
    }
    
    func getAssignments() {
        assignmentList.removeAll()
        AssignmentManager.shared.downloadAssignmentsFromFirebase { (allAssignmnets) in
            for assignmnet in allAssignmnets {
                if assignmnet.assignmentPatientID == self.patientID {
                    self.assignmentList.append(assignmnet)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Navigation
    func showExerciseVC(index: Int) {
        let storyboard = UIStoryboard(name: "Patient", bundle: nil)
        guard let exerciseVC = storyboard.instantiateViewController(identifier: "exerciseVC") as? ExerciseViewController else {
            return
        }
        exerciseVC.assignment = assignmentList[index]
        show(exerciseVC, sender: nil)
    }

    // MARK: - Table view data source & delegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignmentList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: assignmentCell, for: indexPath)
        let week = indexPath.row + 1
        let assignment = assignmentList[indexPath.row]
    
        cell.textLabel?.text = "Week \(week)"
        
        if assignment.assignmentStatus {
            cell.detailTextLabel?.text = "DONE"
            cell.detailTextLabel?.textColor = .green
        } else {
            cell.detailTextLabel?.text = "NOT DONE"
            cell.detailTextLabel?.textColor = .darkGray
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showExerciseVC(index: indexPath.row)
    }
}
