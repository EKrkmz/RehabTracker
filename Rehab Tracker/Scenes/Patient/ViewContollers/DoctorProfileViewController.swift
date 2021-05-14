//
//  DoctorProfileViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 24.04.2021.
//

import UIKit

class DoctorProfileViewController: UIViewController {
    
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorAgeLabel: UILabel!
    @IBOutlet weak var doctorPaymentLabel: UILabel!
    @IBOutlet weak var startSession: UIButton!
    
    var doctor: Doctor?
    var patientID: String?
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutlets()
        patientID = defaults.string(forKey: currentUser)
    }
    
    //MARK: - Actions
    @IBAction func buyTreatmentButton(_ sender: Any) {
        updateFirebase()
        startSession.isHidden = false
    }
    
    @IBAction func startSessionWithDoctor(_ sender: Any) {
    }
    
    func updateFirebase() {
        if var doctor = doctor, let patientID = patientID {
            doctor.doctorPatientList?.append(patientID)
            DoctorManager.shared.updateDoctorPatientList(doctorID: doctor.doctorID, withValues: [kDoctorPatientList : doctor.doctorPatientList!]) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
            PatientManager.shared.updatePatientProfile(patientID: patientID, key: kPatientDoctor, value: doctor.doctorID)
        }
    }
    
    //MARK: - Configure Outlets
    func configureOutlets() {
        
        startSession.isHidden = true
        
        if let doctor = doctor {
            doctorNameLabel.text = doctor.doctorName
            doctorAgeLabel.text = doctor.doctorAge
            doctorPaymentLabel.text = doctor.doctorPayment
        }
    }
}
