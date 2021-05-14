//
//  ExerciseTableViewCell.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 10.05.2021.
//

//MARK: - PATIENT

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exerciseDescriptionLabel: UILabel!
    
    static let exerciseViewCell = "exerciseViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
