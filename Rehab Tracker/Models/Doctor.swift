//
//  Doctor.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 13.05.2021.
//

import Foundation

struct Doctor {
    let doctorEmail: String
    let doctorPassword: String
    var doctorID: String
    let doctorName: String?
    let doctorAge: String?
    let doctorPayment: String?
    var doctorPatientList: [String]?
    
    init() {
        self.doctorID = ""
        self.doctorName = ""
        self.doctorAge = ""
        self.doctorPayment = ""
        self.doctorPatientList = [""]
        self.doctorEmail = ""
        self.doctorPassword = ""
    }
    
    init(dict: NSDictionary) {
        self.doctorID = dict[kDoctorID] as! String
        self.doctorName = dict[kDoctorName] as? String
        self.doctorAge = dict[kDoctorAge] as? String
        self.doctorPayment = dict[kDoctorPayment] as? String
        self.doctorPatientList = dict[kDoctorPatientList] as? [String]
        self.doctorEmail = dict[kDoctorEmail] as! String
        self.doctorPassword = dict[kDoctorPassword] as! String
    }
}
