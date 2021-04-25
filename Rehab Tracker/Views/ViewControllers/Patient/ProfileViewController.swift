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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
}
