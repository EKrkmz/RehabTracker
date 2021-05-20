//
//  Rehab_TrackerTests.swift
//  Rehab TrackerTests
//
//  Created by MYMACBOOK on 23.04.2021.
//

import XCTest
@testable import Rehab_Tracker

class Rehab_TrackerTests: XCTestCase {

    private var viewModel: DoctorsTreatmentsViewModel!
    private var view: MockView!
    private var mockPatientManager: MockPatientManager!
    private var mockDoctorManager: MockDoctorManager!
    
    override func setUp() {
        
//firebase'den veri çektiğim manager'lar yerine mock manager'ları kullandım. test amacıyla ikiside direkt patient ve doctor return ediyor. completion()'ı yazdırmayıp fail halinide test ettim..
        
        mockPatientManager = MockPatientManager()
        mockDoctorManager = MockDoctorManager()
        viewModel = .init(doctorManager: mockDoctorManager, patientManager: mockPatientManager)
        view = MockView()
        viewModel.delegate = view
    }
    
    func testExample() throws {
        viewModel.getPatient(patientID: "1")
        
       // XCTAssertNil(view.doctor)    //nil değilse fail oluyor
        XCTAssertNotNil(view.doctor)
        
       // XCTAssertEqual(view.patient?.patientID, "1")   //fail case
        XCTAssertEqual(view.patient?.patientID, "patient id")   //success
        
        if view.patient?.patientName == "" {
            XCTFail("Name cannot be empty string")
        }
        
        let patientCount = view.doctor?.doctorPatientList?.count
        XCTAssertLessThan(patientCount!, 2)
        XCTAssertGreaterThan(patientCount!, 0, "Doctor has at least 1 patient")
    }

}

private class MockView: DoctorsTreatmentsViewModelDelegate {
    var patient: Patient?
    var doctor: Doctor?
    
    func configureViewModelOutput(output: DoctorsTreatmentsViewModelOutput) {
        switch output {
        case .getPatient(let patient):
            self.patient = patient
        case .getDoctor(let doctor):
            self.doctor = doctor
        }
    }
}
