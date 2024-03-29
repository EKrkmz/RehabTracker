//
//  DoctorsTreatmentsTableViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 24.04.2021.
//

import UIKit

class DoctorsTreatmentsTableViewController: UITableViewController {
    
    var patientID: String?
    private var patient: Patient?
    private var doctor: Doctor?
    
    var viewModel: DoctorsTreatmentsViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getPatient(patientID: patientID!)
        
        /*
        PatientManager.shared.downloadPatientWithID(patientID: patientID!) { (patient) in
            self.getDoctor(doctorID: patient.patientDoctor ?? "You have no doctor yet")
            self.patient = patient
        }*/
    }
    /*
    func getDoctor(doctorID: String) {
        DoctorManager.shared.downloadDoctorWithID(doctorID: doctorID) { (doctor) in
            self.doctor = doctor
            self.tableView.reloadData()
        }
    }*/

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorsTreatmentsCell", for: indexPath)
        
        cell.textLabel?.text = doctor?.doctorName
        
        if let status = patient?.patientTreatmentStatus {
            if status {
                cell.detailTextLabel?.text = "Ongoing"
            } else {
                cell.detailTextLabel?.text = "No ongoing treatment"
            }
        }
        
        return cell
    }
}

extension DoctorsTreatmentsTableViewController: DoctorsTreatmentsViewModelDelegate {
    func configureViewModelOutput(output: DoctorsTreatmentsViewModelOutput) {
        switch output {
        case .getDoctor(let doctor):
            self.doctor = doctor
            self.tableView.reloadData()
        case .getPatient(let patient):
            self.patient = patient
            self.tableView.reloadData()
        }
    }
}
