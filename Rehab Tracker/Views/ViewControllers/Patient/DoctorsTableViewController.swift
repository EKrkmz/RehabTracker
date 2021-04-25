//
//  DoctorsTableViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 24.04.2021.
//

import UIKit

class DoctorsTableViewController: UITableViewController {
    
    var doctorsNameExample = ["d1","d2","d3"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func navigateDoctorProfile() {
        let storyboard = UIStoryboard(name: "Patient", bundle: nil)
        let doctorProfileVC = storyboard.instantiateViewController(identifier: "doctorProfileVC") as! DoctorProfileViewController
        show(doctorProfileVC, sender: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return doctorsNameExample.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorsTableViewCell", for: indexPath)
        
        let doctor = doctorsNameExample[indexPath.row]
        cell.textLabel?.text = doctor
        
        //nothing else needed for this page
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigateDoctorProfile()
        
    }
}
