//
//  ViewController.swift
//  CodeNotes2.0
//
//  Created by Ari Jain on 12/27/19.
//  Copyright © 2019 Arihant Jain. All rights reserved.
//

import UIKit

struct Notebook {
    var notebookName = String?("")
    var date = Date()
}

var arrayOfNotebooks: [Notebook] = []
var setOfNotebookNames = Set<String>()

class ViewController: UIViewController {

    //Variables
    @IBOutlet var UntitledNotesNtbk: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (arrayOfNotebooks.count == 0) {
            let newNotebook = Notebook(notebookName: "Unfiled Notes", date: Date())
            arrayOfNotebooks.append(newNotebook)
            setOfNotebookNames.insert("Unfiled Notes")
        }
        //Updates the UI
        NotificationCenter.default.addObserver(forName: .updateInterface, object: nil, queue: OperationQueue.main) { (notification) in
            self.updateUI()
        }
    }
    
    func updateUI() {
        
    }
    
}

