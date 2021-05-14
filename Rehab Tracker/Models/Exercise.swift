//
//  Exercise.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 11.05.2021.
//

import UIKit

struct Exercise {
    let exerciseID: String?
    let exerciseName: String?
    let exerciseDescription: String?
    let exerciseImageName: String?
    let image: UIImage?
    
    init(dict: NSDictionary) {
        self.exerciseImageName = dict[kExerciseImageName] as? String ?? "N/A"
        self.exerciseID = dict[kExerciseID] as? String ?? "N/A"
        self.exerciseName = dict[kExerciseName] as? String ?? "N/A"
        self.exerciseDescription = dict[kExerciseDescription] as? String ?? "N/A"
        self.image = UIImage(named: dict[kExerciseImageName] as? String ?? "p-logo")
    }
}
