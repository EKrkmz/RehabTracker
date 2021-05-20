//
//  DoctorProfileViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 24.04.2021.
//

import UIKit

class DoctorProfileViewController: UIViewController {
    
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorAgeLabel: UILabel!
    @IBOutlet weak var doctorPaymentLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var doctor: Doctor?
    var patientID: String?
    var patientName: String?
    private let defaults = UserDefaults.standard
    var comments: [Comment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutlets()
        patientID = defaults.string(forKey: currentPatientID)
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let patientID = patientID else { return }
        PatientManager.shared.downloadPatientWithID(patientID: patientID) { (patient) in
            self.patientName = patient.patientName
        }
        loadComments()
    }
    
    //MARK: - Actions
    @IBAction func buyTreatmentButton(_ sender: Any) {
        updateFirebase()
    }
    
    @IBAction func startSessionWithDoctor(_ sender: Any) {
        showSession()
    }
    
    @IBAction func addComment(_ sender: Any) {
        guard let doctorID = doctor?.doctorID else { return }
        var comment = Comment()
        comment.comment = commentTextField.text ?? ""
        comment.commentDoctorID = doctorID
        comment.commentDate = dateFormatter()
        comment.commentPatientName = patientName ?? "N/A"
        
        CommentManager.shared.saveCommentToFirestore(comment: comment )
        
        commentTextField.text = nil
        loadComments()
    }
    
    func loadComments() {
        comments.removeAll()
        guard let doctorID = doctor?.doctorID else { return }
        CommentManager.shared.downloadCommentsFromFirebase(withDoctorID: doctorID) { (comments) in
            self.comments = comments
            self.tableView.reloadData()
        }
    }
    
    func updateFirebase() {
        if var doctor = doctor, let patientID = patientID {
            doctor.doctorPatientList?.append(patientID)
            DoctorManager.shared.updateDoctorPatientList(doctorID: doctor.doctorID, withValues: [kDoctorPatientList : doctor.doctorPatientList!]) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
            PatientManager.shared.updatePatientProfile(patientID: patientID, key: kPatientDoctor, value: doctor.doctorID)
        }
    }
    
    //MARK: - Configure Outlets
    func configureOutlets() {
        if let doctor = doctor {
            doctorNameLabel.text = doctor.doctorName
            doctorAgeLabel.text = doctor.doctorAge
            doctorPaymentLabel.text = doctor.doctorPayment
        }
    }
    
    //MARK: - Navigation
    func showSession() {
        let storyboard = UIStoryboard(name: "Session", bundle: nil)
        guard let sessionVC = storyboard.instantiateViewController(identifier: "sessionVC") as? SessionViewController else { return }
        sessionVC.doctorID = doctor?.doctorID
        show(sessionVC, sender: nil)
    }
    
}

extension DoctorProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as? CommentTableViewCell else {
            return UITableViewCell()
        }
        let comment = comments[indexPath.row]
        cell.configure(comment: comment)
        return cell
    }
}
