//
//  CollectionViewController.swift
//  CodeNotes2.0
//
//  Created by Ari Jain on 4/19/20.
//  Copyright © 2020 Arihant Jain. All rights reserved.
//

import UIKit

struct Notebook {
    var notebookName = String?("")
    var date = Date()
}

var arrayOfNotebooks: [Notebook] = []
var setOfNotebookNames = Set<String>()

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var CollectionViewOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the side inserts of the CollectionView
        let flow = CollectionViewOutlet.collectionViewLayout as! UICollectionViewFlowLayout
           flow.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
           flow.minimumLineSpacing = 50
        
        //Creates a new Unfiled Notees notebook if needed
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
   
    //Creates the CodeNotes header at the top of the collectionView
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            // Customize headerView here
            return headerView
        }
        fatalError()
    }
        
    //Sets the size of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((CollectionViewOutlet.frame.size.width) / 4), height: ((CollectionViewOutlet.frame.size.height) / 4))
    }
    
    
    //Returns number of notebooks to put into the collectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfNotebooks.count
    }
    
    //Returns the cell object built on the main storyboard
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as UICollectionViewCell
        return cell
    }
    
    //Updates the UI of the homepage
    func updateUI() {
        CollectionViewOutlet.reloadData()
        print(setOfNotebookNames)
    }
}
