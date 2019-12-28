//
//  CreateNewSubjectViewController.swift
//  CodeNotes2.0
//
//  Created by Ari Jain on 12/27/19.
//  Copyright © 2019 Arihant Jain. All rights reserved.
//

import UIKit

class CreateNewSubjectViewController: UIViewController {
    //Variables

    @IBOutlet weak var nameOfSubject: UITextField!{ didSet { nameOfSubject.delegate = self as? UITextFieldDelegate } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configuretextFields()
        configureTapGesture()
        // Do any additional setup after loading the view.
    
        
//        let placeHolder = NSMutableAttributedString()
//        let Name  = "Placeholder Text"
//
//
//        // Set the color
//        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range:NSRange(location:0,length:Name.count))
//
//        // Add attribute
//        nameOfSubject.attributedPlaceholder = placeHolder
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func doneButtonTapped(_ sender: Any) {
        
    }
    
    private func configuretextFields() {
        nameOfSubject.delegate = self as? UITextFieldDelegate
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateNewSubjectViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}


//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}
