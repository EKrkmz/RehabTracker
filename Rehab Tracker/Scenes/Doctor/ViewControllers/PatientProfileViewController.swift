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
    
    var patient: Patient?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutlets()
      
    }
    
    //MARK: - Actions
    @IBAction func startSessionWithPatient(_ sender: Any) {
        
    }
    
    @IBAction func assignTrainingButton(_ sender: Any) {
        
    }
    
    @IBAction func finishTreatment(_ sender: Any) {
        
    }
    
    //MARK: - Configure Outlets
    func configureOutlets() {
        guard let patient = patient else { return }
        patientNameLabel.text = patient.patientName
        patientGenderLabel.text = patient.patientGender
        patientAgeLabel.text = patient.patientAge
        medicalHistoryTextView.text = patient.patientMedicalHistory
        currentProblemTextView.text = patient.patientCurrentProblem
    }
}
