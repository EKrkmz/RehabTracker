//
//  DoctorsTableViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 24.04.2021.
//

import UIKit

class DoctorsTableViewController: UITableViewController {
    
    private var doctorList: [Doctor] = []
  
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DoctorManager.shared.downloadDoctorsFromFirebase { (doctorList) in
            self.doctorList = doctorList
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Navigation
    func navigateDoctorProfile(index: Int) {
        let storyboard = UIStoryboard(name: "Patient", bundle: nil)
        guard let doctorProfileVC = storyboard.instantiateViewController(identifier: "doctorProfileVC") as? DoctorProfileViewController else {
            return
        }
        doctorProfileVC.doctor = doctorList[index]
        show(doctorProfileVC, sender: nil)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorsTableViewCell", for: indexPath)
        let doctor = doctorList[indexPath.row]
        cell.textLabel?.text = "Dr. \(doctor.doctorName ?? "N/A")"
        return cell
    }
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateDoctorProfile(index: indexPath.row)
    }
}
