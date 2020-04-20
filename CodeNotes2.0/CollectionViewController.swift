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
        
//        let flow = CollectionViewOutlet.collectionViewLayout as! UICollectionViewFlowLayout // If you create collectionView programmatically then just create this flow by UICollectionViewFlowLayout() and init a collectionView by this flow.
//
//           let itemSpacing: CGFloat = 3
//           let itemsInOneLine: CGFloat = 3
//           flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//           let width = UIScreen.main.bounds.size.width - itemSpacing * CGFloat(itemsInOneLine - 1) //collectionView.frame.width is the same as  UIScreen.main.bounds.size.width here.
//           flow.itemSize = CGSize(width: floor(width/itemsInOneLine), height: width/itemsInOneLine)
//           flow.minimumInteritemSpacing = 3
//           flow.minimumLineSpacing = 3
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 239, height: 314)
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
            return CGSize(width: width, height: width)
        }else{
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
