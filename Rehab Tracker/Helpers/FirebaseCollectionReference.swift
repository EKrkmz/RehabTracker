//
//  FirebaseCollectionReference.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 11.05.2021.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case Exercises
    case Patients
    case Doctors
    case Sessions
    case Assignments
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
