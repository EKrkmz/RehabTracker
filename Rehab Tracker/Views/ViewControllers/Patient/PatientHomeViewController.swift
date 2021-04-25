//
//  PatientHomeViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 23.04.2021.
//

import UIKit

class PatientHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutButton(_ sender: Any) {
    }
    
    
    @IBAction func seeDoctorsTreatmentsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Patient", bundle: nil)
        let doctorsTreatmentsVC = storyboard.instantiateViewController(identifier: "doctorsTreatmentsVC") as! DoctorsTreatmentsTableViewController
        show(doctorsTreatmentsVC, sender: nil)
    }
    
}
