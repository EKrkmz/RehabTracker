//
//  SessionManager.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 14.05.2021.
//

import Foundation

class SessionManager {
    
    static let shared = SessionManager()
    private init() {}
    
    //MARK: - Download Session From Firebase
    func downloadSessionFromFirebase(doctorID: String, completion: @escaping (_ session: Session?) -> Void) {
        FirebaseReference(.Sessions).whereField(kSessionDoctorID, isEqualTo: doctorID).addSnapshotListener { (snapshot, error) in
            
            guard let snapshot = snapshot else {
                completion(nil)
                return
            }
            
            if !snapshot.isEmpty && snapshot.documents.count > 0 {
                let session = Session(dict: snapshot.documents.first!.data() as NSDictionary)
                completion(session)
            } else {
                completion(nil)
            }
        }
    }
    
    //MARK: - Save messages to Firebase
    func saveSessionToFirebase(session: Session) {
        FirebaseReference(.Sessions).document(session.sessionID).setData(sessionDictionaryForm(session) as! [String : Any])
    }
    
    //MARK: - Session dictionary form
    func sessionDictionaryForm(_ session: Session) -> NSDictionary {
        return NSDictionary(objects: [session.sessionID, session.sessionDoctorID, session.sessionPatientID, session.sessionMessages, session.sessionMessageDate], forKeys: [kSessionID as NSCopying, kSessionDoctorID as NSCopying, kSessionPatientID as NSCopying, kSessionMessages as NSCopying, kSessionMessageDate as NSCopying])
    }
    
    //MARK: - Update Message List
    func updateMessageList(sessionID: String, withValues: [String : Any], completion: @escaping (_ error: Error?) -> Void) {
        FirebaseReference(.Sessions).document(sessionID).updateData(withValues) { (error) in
            completion(error)
        }
    }
    
    //MARK: - End Session
    func endSession(sessionID: String) {
        FirebaseReference(.Sessions).document(sessionID).delete()
    }
}
