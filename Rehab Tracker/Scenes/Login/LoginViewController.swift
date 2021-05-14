//
//  ViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 23.04.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var userID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func signInAsDoctor(_ sender: Any) {
        DoctorManager.shared.downloadDoctorsFromFirebase { (doctorList) in
            for doctor in doctorList {
                if doctor.doctorEmail == self.emailTextField.text && doctor.doctorPassword == self.passwordTextField.text {
                    self.userID = doctor.doctorID
                    self.goToDoctorHomeVC()
                }
            }
        }
    }
    @IBAction func signInAsPatient(_ sender: Any) {
        PatientManager.shared.downloadPatientsFromFirebase { (patientList) in
            for patient in patientList {
                if patient.patientEmail == self.emailTextField.text && patient.patientPassword == self.passwordTextField.text {
                    self.userID = patient.patientID
                    self.goToPatientHomeVC()
                }
            }
        }
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        goToSignUpVC()
    }
    
    //MARK: - Navigation Methods
    
    func goToDoctorHomeVC() {
        saveCurrentUserToUserDefaults()
        performSegue(withIdentifier: "doctorSegue", sender: nil)
    }
    
    func goToSignUpVC() {
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let signUpVC = storyboard.instantiateViewController(identifier: "signUpVC") as? SignupViewController else {
            return
        }
        show(signUpVC, sender: nil)
    }
    
    func goToPatientHomeVC() {
        saveCurrentUserToUserDefaults()
        performSegue(withIdentifier: "patientSegue", sender: nil)
    }
    
    //MARK:- Current user UserDefaults
    func saveCurrentUserToUserDefaults() {
        UserDefaults.standard.setValue(userID, forKey: currentUser)
    }
}
