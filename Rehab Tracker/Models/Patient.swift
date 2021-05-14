//
//  Patient.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 13.05.2021.
//

import Foundation

struct Patient {
    var patientID: String
    var patientEmail: String
    var patientPassword: String
    var patientName: String?
    var patientGender: String?
    var patientAge: String?
    var patientMedicalHistory: String?
    var patientCurrentProblem: String?
    var patientDoctor: String?
    var patientAssignments: [String]?
    var patientTreatmentStatus: Bool
    
    init() {
        self.patientID = UUID().uuidString
        self.patientName = ""
        self.patientGender = ""
        self.patientAge = ""
        self.patientMedicalHistory = ""
        self.patientCurrentProblem = ""
        self.patientDoctor = ""
        self.patientAssignments = [""]
        self.patientEmail = ""
        self.patientPassword = ""
        self.patientTreatmentStatus = false
    }
    
    init(dict: NSDictionary) {
        self.patientID = dict[kPatientID] as! String
        self.patientName = dict[kPatientName] as? String
        self.patientGender = dict[kPatientGender] as? String
        self.patientAge = dict[kPatientAge] as? String
        self.patientMedicalHistory = dict[kPatientMedicalHistory] as? String
        self.patientCurrentProblem = dict[kPatientCurrentProblem] as? String
        self.patientDoctor = dict[kPatientDoctor] as? String
        self.patientAssignments = dict[kPatientAssignments] as? [String]
        self.patientEmail = dict[kPatientEmail] as! String
        self.patientPassword = dict[kPatientPassword] as! String
        self.patientTreatmentStatus = dict[kPatientTreatmentStatus] as! Bool
    }
}
