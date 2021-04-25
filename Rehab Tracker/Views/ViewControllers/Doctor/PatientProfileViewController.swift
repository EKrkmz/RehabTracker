//
//  PatientProfileViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 25.04.2021.
//

import UIKit

class PatientProfileViewController: UIViewController {
    
    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var patientGenderLabel: UILabel!
    @IBOutlet weak var patientAgeLabel: UILabel!
    @IBOutlet weak var medicalHistoryTextView: UITextView!
    @IBOutlet weak var currentProblemTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func assignTrainingButton(_ sender: Any) {
    }
    
}
