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
        
        //MARK: - TEST
        NotificationCenter.default.addObserver(self, selector: #selector(CollectionViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        
        //Sets the side inserts of the CollectionView
        let flow = CollectionViewOutlet.collectionViewLayout as! UICollectionViewFlowLayout
           flow.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
           flow.minimumLineSpacing = 50
        
        //Creates a new Unfiled Notes notebook if needed
        if (arrayOfNotebooks.count == 0) {
            let newNotebook = Notebook(notebookName: "Unfiled Notes", date: Date())
            arrayOfNotebooks.append(newNotebook)
            setOfNotebookNames.insert("Unfiled Notes")
        }
        //Updates the UI
        NotificationCenter.default.addObserver(forName: .updateInterface, object: nil, queue: OperationQueue.main) { (notification) in
            self.updateUI()
        }
        
        //MARK: --TEST
        //CollectionViewOutlet?.setCollectionViewLayout(CustomFlowLayout(), animated: false)

    
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
//        return CGSize(width: ((CollectionViewOutlet.frame.size.width) / 4), height: ((CollectionViewOutlet.frame.size.height) / 4))
        
        if UIDevice.current.orientation.isLandscape {
            print("LANDSCAPE")
            //layout.invalidateLayout()
            //return CGSize(width: CollectionViewOutlet.frame.width / 3.5, height: CollectionViewOutlet.frame.height / 3)
            return rotated()
        } else if UIDevice.current.orientation.isPortrait {
            print("PORTRAIT")
//            layout.invalidateLayout()
//            return CGSize(width: CollectionViewOutlet.frame.width / 4.9, height: CollectionViewOutlet.frame.height / 4)
            return rotated()
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    
    //Returns number of notebooks to put into the collectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfNotebooks.count
    }
    
    //Returns the cell object built on the main storyboard
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! NotebookCell
        
//        UIView.animate(withDuration: 1.4 , delay: 0.15 * Double(indexPath.row),  animations: {
//               cell.alpha = 0.0
//               cell.transform = CGAffineTransform(translationX: 0.0, y: 500.0)
//           })
        
        //Update label with name and date for every notebook in the array
        cell.notebookLabel.text = arrayOfNotebooks[indexPath.row].notebookName
        //cell.notebookLabel.font = cell.notebookLabel.font.withSize(self.view.frame.width * 0.022)
        cell.notebookLabel.font = UIFont.preferredFont(forTextStyle: .body)
        cell.notebookLabel.adjustsFontForContentSizeCategory = true
        cell.dateLabel.text = cell.convertDate(date: arrayOfNotebooks[indexPath.row].date)
        //cell.dateLabel.font = cell.dateLabel.font.withSize(self.view.frame.width * 0.01)
        cell.dateLabel.font = UIFont.preferredFont(forTextStyle: .body)
        cell.dateLabel.adjustsFontForContentSizeCategory = true
        //((pow(self.view.frame.width, 2) + pow(self.view.frame.height, 2)).squareRoot() * 0.014)
        
        return cell
    }
    
    //Updates the UI of the homepage
    func updateUI() {
        let insertedIndexPath = IndexPath(item: arrayOfNotebooks.count - 1, section: 0)
        CollectionViewOutlet?.insertItems(at: [insertedIndexPath])

//        let indexPath = IndexPath(item: arrayOfNotebooks.count - 1, section: 0)
//        CollectionViewOutlet?.performBatchUpdates({CollectionViewOutlet?.insertItems(at: [indexPath])}, completion: nil)
    }
    
    @objc func rotated() -> CGSize {
        if UIDevice.current.orientation.isLandscape, let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            print("landscape")
            //let width = view.frame.height
            layout.itemSize = CGSize(width: CollectionViewOutlet.frame.width / 3.5, height: CollectionViewOutlet.frame.height / 3)
            layout.invalidateLayout()
            return layout.itemSize
        } else if UIDevice.current.orientation.isPortrait, let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            print("portrait")
            //let width = view.frame.width
            layout.itemSize = CGSize(width: CollectionViewOutlet.frame.width / 4.9, height: CollectionViewOutlet.frame.height / 4)
            layout.invalidateLayout()
            return layout.itemSize
        }
        return CGSize(width: 0, height: 0)
        //collectionView(UICollectionView, UICollectionViewLayout, IndexPath)
    }
}

