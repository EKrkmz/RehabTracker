//
//  ExerciseManager.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 11.05.2021.
//

import Foundation

class ExerciseManager {
    static let shared = ExerciseManager()
    private init() {}
    
    //MARK: - Download Exercises from Firebase
    func downloadExercisesFromFirebase(completion: @escaping(_ exerciseArray: [Exercise]) -> Void) {
        var exerciseArray: [Exercise] = []
        FirebaseReference(.Exercises).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else {
                completion(exerciseArray)
                return
            }
            
            if !snapshot.isEmpty {
                for exerciseDict in snapshot.documents {
                    exerciseArray.append(Exercise(dict: exerciseDict.data() as NSDictionary))
                }
            }
            completion(exerciseArray)
        }
    }
}
