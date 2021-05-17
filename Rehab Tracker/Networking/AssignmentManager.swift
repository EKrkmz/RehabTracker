//
//  AssignmentManager.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 16.05.2021.
//

import Foundation

class AssignmentManager {
    static let shared = AssignmentManager()
    private init() {}
    
    //MARK: - Save Assignment to Firebase
    func saveAssignmentToFirebase(_ assignment: Assignment) {
        FirebaseReference(.Assignments).document(assignment.assignmentID).setData((assignmentDictionaryForm(assignment) as! [String : Any]))
    }
    
    //MARK: - Helper Functions
    func assignmentDictionaryForm(_ assignment: Assignment) -> NSDictionary {
        return NSDictionary(objects: [assignment.assignmentID, assignment.assignmentExerciseIDs, assignment.assignmentPatientID, assignment.assignmentDoctorID, assignment.assignmentStatus, assignment.assignmentMsg], forKeys: [kAssignmentID as NSCopying, kAssignmentExerciseIDs as NSCopying, kAssignmentPatientID as NSCopying, kAssignmentDoctorID as NSCopying, kAssignmentStatus as NSCopying, kAssignmentMsg as NSCopying])
    }
    
    //MARK: - Download All Assignments from Firebase
    func downloadAssignmentsFromFirebase(completion: @escaping(_ assignmentArray: [Assignment]) -> Void) {
        var assignmentArray: [Assignment] = []
        FirebaseReference(.Assignments).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                completion(assignmentArray)
                return
            }
            
            if !snapshot.isEmpty {
                for assignmentDict in snapshot.documents {
                    assignmentArray.append(Assignment(dict: assignmentDict.data() as NSDictionary))
                }
            }
            completion(assignmentArray)
        }
    }
    
    //MARK: - Download Assignment with ID
    func downloadAssignmentWithID(assignmentID: String, completion: @escaping(_ assignment: Assignment) -> Void) {
        var assignment = Assignment()
        FirebaseReference(.Assignments).whereField(kAssignmentID, isEqualTo: assignmentID).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                completion(assignment)
                return
            }
            
            if !snapshot.isEmpty {
                for assignmentDict in snapshot.documents {
                    assignment = Assignment(dict: assignmentDict.data() as NSDictionary)
                }
            }
            completion(assignment)
        }
    }
    
    //MARK: - Update Assignment Status
    func updateAssignmentStatus(assignmentID: String, key: String, value: Bool) {
        FirebaseReference(.Assignments).document(assignmentID).getDocument { (snapshot, error) in
            snapshot?.reference.updateData([
                                            key: value])
        }
    }
    
    //MARK: - Update Assignment Message
    func updateAssignmentMsg(assignmentID: String, key: String, value: String) {
        FirebaseReference(.Assignments).document(assignmentID).getDocument { (snapshot, error) in
            snapshot?.reference.updateData([
                                            key: value])
        }
    }
}
