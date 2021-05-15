//
//  DoctorHomeViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 25.04.2021.
//

import UIKit

class DoctorHomeViewController: UIViewController {
    
    private var doctorID: String?
    private let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        doctorID = defaults.string(forKey: currentDoctorID)
    }
    
    //MARK: - Logout the user
    @IBAction func logoutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        defaults.removeObject(forKey: currentDoctorID)
    }
}
