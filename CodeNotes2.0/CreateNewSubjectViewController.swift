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
        if let text = nameOfSubject.text, text.isEmpty {
            nameOfSubject.shake()
        } else {
            notebookName = nameOfSubject.text!
            NotificationCenter.default.post(name: Notification.Name.loadNotebookData, object: self)
            dismiss(animated: true, completion: nil)
        }
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
    
    //Closes overlay if you click outside the popup
    @IBAction func dismissPopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

//Makes text field shake when there is no user input
extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 8.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 8.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
