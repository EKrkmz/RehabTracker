//
//  MockManager.swift
//  Rehab TrackerTests
//
//  Created by MYMACBOOK on 17.05.2021.
//

@testable import Rehab_Tracker

final class MockPatientManager: PatientManagerProtocol {
    func downloadPatientWithID(patientID: String, completion: @escaping(_ patient: Patient) -> Void) {
        var patient = Patient()
        patient.patientID = "patient id"
        //patient.patientDoctor = "doctor id"
        patient.patientName = "name"
        completion(patient)  //completion ile değer döndürmediğimde test fail oluyor 
    }
}

final class MockDoctorManager: DoctorManagerProtocol {
    func downloadDoctorWithID(doctorID: String, completion: @escaping(_ doctor: Doctor) -> Void) {
        var doctor = Doctor()
       //doctor.doctorID = "doctor id"
        completion(doctor)
    }
}
