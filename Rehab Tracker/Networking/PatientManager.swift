//
//  PatientManager.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 13.05.2021.
//

import Foundation

protocol PatientManagerProtocol {
    func downloadPatientWithID(patientID: String, completion: @escaping(_ patient: Patient) -> Void)
}

class PatientManager: PatientManagerProtocol {
    static let shared = PatientManager()
    //private init() {}
    
    //MARK: - Save Patient to Firebase
    func savePatientToFirebase(_ patient: Patient) {
        FirebaseReference(.Patients).document(patient.patientID).setData((patientDictionaryForm(patient) as! [String : Any]))
    }
    
    //MARK: - Helper Functions
    func patientDictionaryForm(_ patient: Patient) -> NSDictionary {
        return NSDictionary(objects: [patient.patientID, patient.patientEmail, patient.patientPassword, patient.patientName, patient.patientAge, patient.patientGender, patient.patientDoctor, patient.patientAssignments, patient.patientMedicalHistory, patient.patientCurrentProblem], forKeys: [kPatientID as NSCopying, kPatientEmail as NSCopying, kPatientPassword as NSCopying, kPatientName as NSCopying, kPatientAge as NSCopying, kPatientGender as NSCopying, kPatientDoctor as NSCopying, kPatientAssignments as NSCopying, kPatientMedicalHistory as NSCopying, kPatientCurrentProblem as NSCopying])
    }
    
    //MARK: - Download Patients From Firebase
    func downloadPatientsFromFirebase(completion: @escaping(_ patientArray: [Patient]) -> Void) {
        var patientArray: [Patient] = []
        
        FirebaseReference(.Patients).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                completion(patientArray)
                return
            }
            
            if !snapshot.isEmpty {
                for patientDict in snapshot.documents {
                    patientArray.append(Patient(dict: patientDict.data() as NSDictionary))
                }
            }
            completion(patientArray)
        }
    }
    
    //MARK: - Download Patient with ID
    func downloadPatientWithID(patientID: String, completion: @escaping(_ patient: Patient) -> Void) {
        var patient = Patient()
        FirebaseReference(.Patients).whereField(kPatientID, isEqualTo: patientID).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                completion(patient)
                return
            }
            
            if !snapshot.isEmpty {
                for patientDict in snapshot.documents {
                    patient = Patient(dict: patientDict.data() as NSDictionary)
                }
            }
            completion(patient)
        }
    }
    
    //MARK: - Update Patient Profile
    func updatePatientProfile(patientID: String, key: String, value: String) {
        FirebaseReference(.Patients).document(patientID).getDocument { (snapshot, error) in
            snapshot?.reference.updateData([
                                            key: value])
        }
    }
}
