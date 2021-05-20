//
//  CommentTableViewCell.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 20.05.2021.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(comment: Comment) {
        patientNameLabel.text = comment.commentPatientName
        dateLabel.text = comment.commentDate
        commentLabel.text = comment.comment
    }
}
