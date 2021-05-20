//
//  Comment.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 20.05.2021.
//

import Foundation

struct Comment {
    
    var commentID: String
    var comment: String
    var commentDoctorID: String
    var commentPatientName: String
    var commentDate: String
    
    init() {
        self.commentID = UUID().uuidString
        self.comment = ""
        self.commentDoctorID = ""
        self.commentPatientName = ""
        self.commentDate = ""
    }
    
    init(dict: NSDictionary) {
        self.commentID = dict[kCommentID] as! String
        self.comment = dict[kComment] as! String
        self.commentDoctorID = dict[kCommentDoctorID] as! String
        self.commentPatientName = dict[kCommentPatientName] as! String
        self.commentDate = dict[kCommentDate] as! String
    }
}
