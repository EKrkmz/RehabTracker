//
//  AssignExerciseTableViewCell.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 10.05.2021.
//

//MARK: - DOCTOR

import UIKit

class AssignExerciseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    
    static let exerciseCell = "exerciseCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func addButton(_ sender: Any) {
    }
    
    //MARK: - Configure Exercise Cell
    func configure(exercise: Exercise) {
        exerciseNameLabel.text = exercise.exerciseName
        exerciseImageView.image = exercise.image
    }
    
}
