//
//  PatientsViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 25.04.2021.
//

import UIKit

class PatientsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private var defaults = UserDefaults.standard
    private var doctorID: String?
    private var patients: [Patient] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        doctorID = defaults.string(forKey: currentDoctorID)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPatientList()
    }
    
    //MARK: - Get patient IDs
    func getPatientList() {
        guard let doctorID = doctorID else { return }
        DoctorManager.shared.downloadDoctorWithID(doctorID: doctorID) { (doctor) in
            self.getPatients(patientIDs: doctor.doctorPatientList ?? [""])
        }
    }
    
    //MARK: - Get patients from those IDs
    func getPatients(patientIDs: [String]) {
        patients.removeAll()
        for patient in patientIDs {
            PatientManager.shared.downloadPatientWithID(patientID: patient) { (patientFromFirebase) in
                self.patients.append(patientFromFirebase)
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Navigation
    func showPatientProfile(index: Int) {
        let storyboard = UIStoryboard(name: "Doctor", bundle: nil)
        guard let patientProfileVC = storyboard.instantiateViewController(identifier: "patientProfileVC") as? PatientProfileViewController else { return }
        patientProfileVC.patient = patients[index]
        show(patientProfileVC, sender: nil)
    }

}

extension PatientsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "patientsTableViewCell", for: indexPath)
        let patient = patients[indexPath.row]
        cell.textLabel?.text = patient.patientName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showPatientProfile(index: indexPath.row)
    }
}
