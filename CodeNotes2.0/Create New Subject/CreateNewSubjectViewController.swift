//
//  CreateNewSubjectViewController.swift
//  CodeNotes2.0
//
//  Created by Ari Jain on 12/27/19.
//  Copyright © 2019 Arihant Jain. All rights reserved.
//

import UIKit

class CreateNewSubjectViewController: UIViewController, UITextFieldDelegate {
    
    //Variables
    var notebookName = String?("")

    @IBOutlet weak var nameOfSubject: UITextField!{ didSet { nameOfSubject.delegate = self as UITextFieldDelegate } }
  
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Makes keyboard close when you click anywhere on screen
        configureTapGesture()
        
        //Observer to keep track of whether the keyboard is being moved up or down
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    
    }
    
    //Deinitializes the observer that keeps track of whether the keyboard is being moved up or down
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    //Done button is tapped
    @IBAction func doneButtonTapped(_ sender: Any) {
        if let text = nameOfSubject.text, text.isEmpty {
            nameOfSubject.shake()
        } else if (setOfNotebookNames.contains(nameOfSubject.text!)) {
            nameOfSubject.shake()
        } else {
            //Creates new notebook and adds it to the list of notebooks and name to the set of names
            let newNotebook = Notebook(notebookName: nameOfSubject.text!, date: Date())
            arrayOfNotebooks.insert(newNotebook, at: 1)
            setOfNotebookNames.insert(nameOfSubject.text!)
            
            //Updates the UI
            NotificationCenter.default.post(name: Notification.Name.updateInterface, object: self)
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
    
    //Getter for notebook name
    func getNotebookName() -> String {
        return notebookName!
    }
    
    //Moves the view controller up and down depending on whether the keyboard is being used
    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = (-keyboardRect.height / 2)
        } else {
            view.frame.origin.y = 0
        }
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
