//
//  StatusViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 16.05.2021.
//

import UIKit

class StatusViewController: UIViewController {

    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var patientMsgLabel: UILabel!
    
    var assignment: Assignment?
    var patient: Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPatient()
    }
    
    @IBAction func goToPatientPofile(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Doctor", bundle: nil)
        guard let patientProfileVC = storyboard.instantiateViewController(identifier: "patientProfileVC") as? PatientProfileViewController else {
            return
        }
        patientProfileVC.patient = patient
        show(patientProfileVC, sender: nil)
    }
    
    func getPatient() {
        guard let assignment = assignment else { return }
        PatientManager.shared.downloadPatientWithID(patientID: assignment.assignmentPatientID) { (patient) in
            self.patient = patient
            self.configureOutlets()
        }
    }
    
    func configureOutlets() {
        patientNameLabel.text = patient?.patientName
        patientMsgLabel.text = assignment?.assignmentMsg
    }
}
