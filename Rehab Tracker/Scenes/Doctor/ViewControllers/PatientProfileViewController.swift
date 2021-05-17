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
    private let defaults = UserDefaults.standard
    private var doctorID: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutlets()
        doctorID = defaults.string(forKey: currentDoctorID)
    }
    
    //MARK: - Actions
    @IBAction func startSessionWithPatient(_ sender: Any) {
        var session = Session()
        guard let patientID = patient?.patientID, let doctorID = doctorID else { return }
        session.sessionPatientID = patientID
        session.sessionDoctorID = doctorID
        
        SessionManager.shared.saveSessionToFirebase(session: session)
        
        showSession()
    }
    
    @IBAction func assignTrainingButton(_ sender: Any) {
        performSegue(withIdentifier: "assignSegue", sender: nil)
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
    
    //MARK: - Navigation
    func showSession() {
        let storyboard = UIStoryboard(name: "Session", bundle: nil)
        guard let sessionVC = storyboard.instantiateViewController(identifier: "sessionVC") as? SessionViewController else { return }
        sessionVC.doctorID = doctorID
        show(sessionVC, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "assignSegue" {
            let assignVC = segue.destination as! AssignExerciseTableViewController
            assignVC.patientID = patient?.patientID
            assignVC.doctorID = doctorID
        }
    }
}
