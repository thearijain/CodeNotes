//
//  CollectionViewController.swift
//  CodeNotes2.0
//
//  Created by Ari Jain on 4/19/20.
//  Copyright © 2020 Arihant Jain. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var CollectionViewOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flow = CollectionViewOutlet.collectionViewLayout as! UICollectionViewFlowLayout // If you create collectionView programmatically then just create this flow by UICollectionViewFlowLayout() and init a collectionView by this flow.

           flow.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
//           flow.itemSize = CGSize(width: 239, height: 3140)
//           flow.minimumInteritemSpacing = 0
           flow.minimumLineSpacing = 50
        
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
        
    //Puts spacing between cells of the collectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 3
        let _:CGFloat = 120
        let totalSpacing = (CollectionViewOutlet.frame.size.width - 36 - 240) / 3
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            print("ONE")
            return CGSize(width: 239, height: 314)
        }else{
            print("TWO")
            return CGSize(width: 0, height: 0)
        }
    }
    
    

    //Returns number of notebooks in the collectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as UICollectionViewCell
        return cell
    }
}
