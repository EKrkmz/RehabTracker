//
//  PatientHomeViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 23.04.2021.
//

import UIKit

class PatientHomeViewController: UIViewController {

    private var patientID: String?
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        patientID = defaults.string(forKey: currentPatientID)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        defaults.removeObject(forKey: currentPatientID)
    }
    
    @IBAction func seeDoctorsTreatmentsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Patient", bundle: nil)
        let doctorsTreatmentsVC = storyboard.instantiateViewController(identifier: "doctorsTreatmentsVC") as! DoctorsTreatmentsTableViewController
        doctorsTreatmentsVC.patientID = patientID
        show(doctorsTreatmentsVC, sender: nil)
    }
}
