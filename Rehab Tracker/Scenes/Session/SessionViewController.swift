//
//  SessionViewController.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 14.05.2021.
//

import UIKit

class SessionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sessionTextField: UITextField!
    
    var doctorID: String?
    private var sessionID: String?
    private var messageList: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(endSession))]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getSession()
    }
    
    //MARK: - Actions
    @objc func endSession() {
        navigationController?.popViewController(animated: true)
        guard let sessionID = sessionID else { return }
        SessionManager.shared.endSession(sessionID: sessionID)
     }
    
    @IBAction func sendButton(_ sender: Any) {
        getSession()
        let msg = sessionTextField.text
        messageList?.append(msg ?? "")
        
        SessionManager.shared.updateMessageList(sessionID: sessionID!, withValues: [kSessionMessages : messageList!]) { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.sessionTextField.text = nil
                self.tableView.reloadData()
            }
        }
    }
    
    func getSession() {
        SessionManager.shared.downloadSessionFromFirebase(doctorID: doctorID!) { (session) in
            self.sessionID = session?.sessionID
            self.messageList = session?.sessionMessages
            self.tableView.reloadData()
        }
    }
    
}

//MARK: - UITableView Data Source Extension
extension SessionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let messageList = messageList else { return 0 }
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sessionCell", for: indexPath)
        if let messageList = messageList {
            cell.textLabel?.text = messageList[indexPath.row]
            cell.textLabel?.numberOfLines = 0
        }
        return cell
    }
}
