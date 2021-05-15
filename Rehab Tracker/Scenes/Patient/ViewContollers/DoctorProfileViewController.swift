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
    
    var doctor: Doctor?
    var patientID: String?
    private let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutlets()
        patientID = defaults.string(forKey: currentPatientID)
    }
    
    //MARK: - Actions
    @IBAction func buyTreatmentButton(_ sender: Any) {
        updateFirebase()
    }
    
    @IBAction func startSessionWithDoctor(_ sender: Any) {
        showSession()
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
        if let doctor = doctor {
            doctorNameLabel.text = doctor.doctorName
            doctorAgeLabel.text = doctor.doctorAge
            doctorPaymentLabel.text = doctor.doctorPayment
        }
    }
    
    //MARK: - Navigation
    func showSession() {
        let storyboard = UIStoryboard(name: "Session", bundle: nil)
        guard let sessionVC = storyboard.instantiateViewController(identifier: "sessionVC") as? SessionViewController else { return }
        sessionVC.doctorID = doctor?.doctorID
        show(sessionVC, sender: nil)
    }
}
