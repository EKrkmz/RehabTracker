//
//  CommentManager.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 20.05.2021.
//

import Foundation

class CommentManager {
    
    static let shared = CommentManager()
    private init() {}
    
    //MARK: - Save Comment to firestore
    func saveCommentToFirestore(comment: Comment) {
        FirebaseReference(.Comments).document(comment.commentID).setData(commentDictionaryForm(comment: comment) as! [String : Any])
    }
    
    //MARK: - Helper functions
    func commentDictionaryForm(comment: Comment)
    -> NSDictionary {
        return NSDictionary(objects: [comment.commentID, comment.commentDoctorID, comment.commentPatientName, comment.commentDate, comment.comment], forKeys: [kCommentID as NSCopying, kCommentDoctorID as NSCopying, kCommentPatientName as NSCopying, kCommentDate as NSCopying, kComment as NSCopying])
    }
    
    //MARK: Download Func
    func downloadCommentsFromFirebase(withDoctorID: String, completion: @escaping (_ commentArray: [Comment]) -> Void) {
        var commentArray: [Comment] = []
        
        FirebaseReference(.Comments).whereField(kCommentDoctorID, isEqualTo: withDoctorID).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                completion(commentArray)
                return
            }
            
            if !snapshot.isEmpty {
                for commentDict in snapshot.documents {
                    commentArray.append(Comment(dict: commentDict.data() as NSDictionary))
                }
                completion(commentArray)
            }
        }
    }
}
