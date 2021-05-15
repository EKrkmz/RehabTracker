//
//  Session.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 14.05.2021.
//

import Foundation

struct Session {
    
    var sessionID: String
    var sessionPatientID: String
    var sessionDoctorID: String
    var sessionMessages: [String]
    var sessionMessageDate: String
    
    init() {
        self.sessionID = UUID().uuidString
        self.sessionPatientID = ""
        self.sessionMessages = [""]
        self.sessionDoctorID = ""
        self.sessionMessageDate = ""
    }
    
    init(dict: NSDictionary) {
        self.sessionID = dict[kSessionID] as! String
        self.sessionPatientID = dict[kSessionPatientID] as! String
        self.sessionDoctorID = dict[kSessionDoctorID] as! String
        self.sessionMessages = dict[kSessionMessages] as! [String]
        self.sessionMessageDate = dict[kSessionMessageDate] as! String
    }
}
