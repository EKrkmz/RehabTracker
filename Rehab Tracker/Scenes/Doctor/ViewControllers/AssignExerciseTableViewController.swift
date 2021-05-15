//
//  AssignExerciseTableViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 10.05.2021.
//

import UIKit

class AssignExerciseTableViewController: UITableViewController {
    
    private var exerciseArray: [Exercise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(assignExercise))]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ExerciseManager.shared.downloadExercisesFromFirebase { (exerciseArray) in
            self.exerciseArray = exerciseArray
            self.tableView.reloadData()
        }
    }
    
    @objc func assignExercise() {
        
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
       
        return cell
    }
    
}
