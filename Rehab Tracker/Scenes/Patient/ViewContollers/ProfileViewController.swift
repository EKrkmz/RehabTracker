//
//  PatientProfileViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 24.04.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var medicalHistoryTextView: UITextView!
    @IBOutlet weak var currentProblemTextView: UITextView!
    
    let defaults = UserDefaults.standard
    var patientID: String?
    var patient: Patient?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        patientID = defaults.string(forKey: currentUser)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPatient()
    }
    
    //MARK: - Actions
    
    @IBAction func saveButton(_ sender: Any) {
        PatientManager.shared.updatePatientProfile(patientID: patientID!, key: kPatientName, value: nameTextField.text!)
        PatientManager.shared.updatePatientProfile(patientID: patientID!, key: kPatientGender, value: genderTextField.text!)
        PatientManager.shared.updatePatientProfile(patientID: patientID!, key: kPatientAge, value: ageTextField.text!)
        PatientManager.shared.updatePatientProfile(patientID: patientID!, key: kPatientMedicalHistory, value: medicalHistoryTextView.text!)
        PatientManager.shared.updatePatientProfile(patientID: patientID!, key: kPatientCurrentProblem, value: currentProblemTextView.text!)
    }
    
    //MARK: - Get current patient
    func getPatient() {
        PatientManager.shared.downloadPatientWithID(patientID: patientID!) { (patient) in
            self.patient = patient
            self.configureOutlets()
        }
    }
    //MARK: - Configure outlets (UI)
    func configureOutlets() {
        nameTextField.text = patient?.patientName
        genderTextField.text = patient?.patientGender
        ageTextField.text = patient?.patientAge
        medicalHistoryTextView.text = patient?.patientMedicalHistory
        currentProblemTextView.text = patient?.patientCurrentProblem
    }
}
