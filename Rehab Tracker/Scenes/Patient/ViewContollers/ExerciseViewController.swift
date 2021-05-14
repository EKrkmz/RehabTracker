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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    @IBAction func sendMessageButton(_ sender: Any) {
    }

}

extension ExerciseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.exerciseViewCell, for: indexPath) as? ExerciseTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}
