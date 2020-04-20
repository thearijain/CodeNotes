//
//  ViewController.swift
//  CodeNotes2.0
//
//  Created by Ari Jain on 12/27/19.
//  Copyright © 2019 Arihant Jain. All rights reserved.
//

import UIKit

var arrayOfNotebooks: [Notebook] = []
var setOfNotebookNames = Set<String>()

class ViewController: UIViewController {

    //Variables
    @IBOutlet var UntitledNotesNtbk: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(forName: .updateInterface, object: nil, queue: OperationQueue.main) { (notification) in
            self.updateUI()
        }
    }
    
    func updateUI() {
        print("updated")
    }
    
}

struct Notebook {
    var notebookName = String?("")
    var date = Date()
}

