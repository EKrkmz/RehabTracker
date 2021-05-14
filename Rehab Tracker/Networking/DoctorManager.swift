//
//  DoctorManagement.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 13.05.2021.
//

import Foundation

class DoctorManager {
    static let shared = DoctorManager()
    private init() {}
    
    //MARK: - DownloadDoctorsFromFirebase
    func downloadDoctorsFromFirebase(completion: @escaping(_ doctorArray: [Doctor]) -> Void) {
        var doctorArray: [Doctor] = []
        
        FirebaseReference(.Doctors).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                completion(doctorArray)
                return
            }
            
            if !snapshot.isEmpty {
                for doctorDict in snapshot.documents {
                    doctorArray.append(Doctor(dict: doctorDict.data() as NSDictionary))
                }
            }
            completion(doctorArray)
        }
        
    }
    
    //MARK: - Download Doctor with ID
    func downloadDoctorWithID(doctorID: String, completion: @escaping(_ doctor: Doctor) -> Void) {
        var doctor = Doctor()
        FirebaseReference(.Doctors).whereField(kDoctorID, isEqualTo: doctorID).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                completion(doctor)
                return
            }
            
            if !snapshot.isEmpty {
                for doctorDict in snapshot.documents {
                    doctor = Doctor(dict: doctorDict.data() as NSDictionary)
                }
            }
            completion(doctor)
        }
    }
    
    //MARK: - UpdateDoctorPatientList
    func updateDoctorPatientList(doctorID: String, withValues: [String : Any], completion: @escaping (_ error: Error?) -> Void) {
        FirebaseReference(.Doctors).document(doctorID).updateData(withValues) { (error) in
            completion(error)
        }
    }
    
}
