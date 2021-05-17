//
//  AssignExerciseTableViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 10.05.2021.
//

import UIKit

class AssignExerciseTableViewController: UITableViewController {
    
    private var exerciseArray: [Exercise] = []
    private var trainingProgram: [String] = []
    var patientID: String?
    var doctorID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(assignTraining))]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ExerciseManager.shared.downloadExercisesFromFirebase { (exerciseArray) in
            self.exerciseArray = exerciseArray
            self.tableView.reloadData()
        }
    }
    
    @objc func assignTraining() {
        var assignment = Assignment()
        assignment.assignmentExerciseIDs = trainingProgram
        assignment.assignmentDoctorID = doctorID!
        assignment.assignmentPatientID = patientID!
        
        AssignmentManager.shared.saveAssignmentToFirebase(assignment)
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AssignExerciseTableViewCell.exerciseCell, for: indexPath) as? AssignExerciseTableViewCell else {
            return UITableViewCell()
        }
        
        let exercise = exerciseArray[indexPath.row]
        cell.configure(exercise: exercise)
        cell.delegate = self
        return cell
    }
}

extension AssignExerciseTableViewController: AssignExerciseDelegate {
    func addToList(exerciseID: String) {
        if trainingProgram.contains(exerciseID) {
            trainingProgram = trainingProgram.filter { $0 != exerciseID }
        } else {
            trainingProgram.append(exerciseID)
        }
    }
}
