//
//  ViewController.swift
//  CodeNotes2.0
//
//  Created by Ari Jain on 12/27/19.
//  Copyright © 2019 Arihant Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Variables
//    @IBOutlet var addNotebookButton: UIButton!
    @IBOutlet var UntitledNotesNtbk: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(forName: .loadNotebookData, object: nil, queue: OperationQueue.main) { (notification) in
            print(CreateNewSubjectViewController.getNotebookName)
            }
    }
}

