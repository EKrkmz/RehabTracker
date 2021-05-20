//
//  DoctorsViewModel.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 17.05.2021.
//

import Foundation

protocol DoctorsTreatmentsViewModelProtocol {
    var delegate: DoctorsTreatmentsViewModelDelegate? { get set }
    func getDoctor(doctorID: String)
    func getPatient(patientID: String)
}
enum DoctorsTreatmentsViewModelOutput {
    case getDoctor(Doctor)
    case getPatient(Patient)
}

protocol DoctorsTreatmentsViewModelDelegate: AnyObject {
    func configureViewModelOutput(output: DoctorsTreatmentsViewModelOutput)
}


class DoctorsTreatmentsViewModel: DoctorsTreatmentsViewModelProtocol {

    private let doctorManager: DoctorManagerProtocol
    private let patientManager: PatientManagerProtocol
    weak var delegate: DoctorsTreatmentsViewModelDelegate?
    
    init(doctorManager: DoctorManagerProtocol = DoctorManager(), patientManager: PatientManagerProtocol = PatientManager()) {
        self.doctorManager = doctorManager
        self.patientManager = patientManager
    }
    
    func getPatient(patientID: String) {
        patientManager.downloadPatientWithID(patientID: patientID) { (patient) in
            self.delegate?.configureViewModelOutput(output: .getPatient(patient))
            self.getDoctor(doctorID: patient.patientDoctor ?? "you have no doctor")
        }
    }
    
    func getDoctor(doctorID: String) {
        doctorManager.downloadDoctorWithID(doctorID: doctorID) { (doctor) in
            self.delegate?.configureViewModelOutput(output: .getDoctor(doctor))
        }
    }
}
