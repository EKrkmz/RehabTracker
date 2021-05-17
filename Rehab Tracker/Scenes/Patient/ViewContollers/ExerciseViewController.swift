//
//  ExerciseViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 10.05.2021.
//

import UIKit

class ExerciseViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextView: UITextView!
    
    var assignment: Assignment?
    private var exerciseList: [Exercise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getExercises()
    }
    
    @IBAction func sendMessageButton(_ sender: Any) {
        guard let assignment = assignment else { return }
        AssignmentManager.shared.updateAssignmentStatus(assignmentID: assignment.assignmentID, key: kAssignmentStatus, value: true)
        AssignmentManager.shared.updateAssignmentMsg(assignmentID: assignment.assignmentID, key: kAssignmentMsg, value: messageTextView.text)
        messageTextView.text = nil
        navigationController?.popViewController(animated: true)
    }
    
    func getExercises() {
        guard let assignment = assignment else { return }
        let exerciseIDs = assignment.assignmentExerciseIDs
        
        ExerciseManager.shared.downloadExercisesFromFirebase { (allExercises) in
            for exercise in allExercises {
                if exerciseIDs.contains(exercise.exerciseID!) {
                    self.exerciseList.append(exercise)
                }
            }
            self.tableView.reloadData()
        }
    }

}

extension ExerciseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.exerciseViewCell, for: indexPath) as? ExerciseTableViewCell else {
            return UITableViewCell()
        }
        
        let exercise = exerciseList[indexPath.row]
        cell.configure(exercise: exercise)
        return cell
    }
}
