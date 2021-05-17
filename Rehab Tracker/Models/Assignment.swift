//
//  Assignment.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 16.05.2021.
//

import Foundation

struct Assignment {
    
    var assignmentID: String
    var assignmentExerciseIDs: [String]
    var assignmentPatientID: String
    var assignmentDoctorID: String
    var assignmentStatus: Bool
    var assignmentMsg: String
    
    init() {
        self.assignmentID = UUID().uuidString
        self.assignmentExerciseIDs = [""]
        self.assignmentPatientID = ""
        self.assignmentDoctorID = ""
        self.assignmentStatus = false
        self.assignmentMsg = ""
    }
    
    init(dict: NSDictionary) {
        self.assignmentID = dict[kAssignmentID] as! String
        self.assignmentExerciseIDs = dict[kAssignmentExerciseIDs] as! [String]
        self.assignmentPatientID = dict[kAssignmentPatientID] as! String
        self.assignmentDoctorID = dict[kAssignmentDoctorID] as! String
        self.assignmentStatus = dict[kAssignmentStatus] as! Bool
        self.assignmentMsg = dict[kAssignmentMsg] as! String
    }
}
