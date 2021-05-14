//
//  PatientHomeViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 23.04.2021.
//

import UIKit

class PatientHomeViewController: UIViewController {

    var patientID: String?
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentUserID()
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        defaults.removeObject(forKey: currentUser)
    }
    
    @IBAction func seeDoctorsTreatmentsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Patient", bundle: nil)
        let doctorsTreatmentsVC = storyboard.instantiateViewController(identifier: "doctorsTreatmentsVC") as! DoctorsTreatmentsTableViewController
        doctorsTreatmentsVC.patientID = patientID
        show(doctorsTreatmentsVC, sender: nil)
    }
    
    func getCurrentUserID() {
        patientID = defaults.string(forKey: currentUser)
    }
    
}
