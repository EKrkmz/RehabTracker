//
//  DoctorHomeViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 25.04.2021.
//

import UIKit

class DoctorHomeViewController: UIViewController {
    
    var doctorID: String?
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentUserID()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - Logout the user
    @IBAction func logoutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        defaults.removeObject(forKey: currentUser)
    }
    
    func getCurrentUserID() {
        doctorID = defaults.string(forKey: currentUser)
    }

}
