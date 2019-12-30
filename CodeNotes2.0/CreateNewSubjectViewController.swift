//
//  CreateNewSubjectViewController.swift
//  CodeNotes2.0
//
//  Created by Ari Jain on 12/27/19.
//  Copyright © 2019 Arihant Jain. All rights reserved.
//

//Global variables
var notebookName = ""


import UIKit

class CreateNewSubjectViewController: UIViewController, UITextFieldDelegate {
    
    //Variables
    @IBOutlet weak var nameOfSubject: UITextField!{ didSet { nameOfSubject.delegate = self as UITextFieldDelegate } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Makes keyboard close when you click anywhere on screen
        configureTapGesture()
    
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        notebookName = nameOfSubject.text!
        NotificationCenter.default.post(name: Notification.Name.loadNotebookData, object: self)
        dismiss(animated: true, completion: nil)
    }
    

    //Next two functions makes keyboard close when you click anywhere on screen
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateNewSubjectViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }

    //Makes keyboard close when you click return button on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
