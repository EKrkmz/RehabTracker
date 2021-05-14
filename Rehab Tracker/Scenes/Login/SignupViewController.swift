//
//  SignupViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 23.04.2021.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailTextFieldSignUp: UITextField!
    @IBOutlet weak var passwordTextFieldSignUp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Signup the Patient
    @IBAction func signUpButton(_ sender: Any) {
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)

        var patient = Patient()
        
        if let email = emailTextFieldSignUp.text, let password = passwordTextFieldSignUp.text {
            patient.patientEmail = email
            patient.patientPassword = password
        }
        
        if fieldsAreCompleted() {
            PatientManager.shared.savePatientToFirebase(patient)
            let alert = UIAlertController(title: "Success", message: "You are signed up!", preferredStyle: .alert)
            alert.addAction(action)
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "All fields are required!", preferredStyle: .alert)
            alert.addAction(action)
            present(alert, animated: true)
        }
        
    }
    
    @IBAction func goToSignInButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func fieldsAreCompleted() -> Bool {
        return emailTextFieldSignUp.text != "" && passwordTextFieldSignUp.text != ""
    }
    
}
