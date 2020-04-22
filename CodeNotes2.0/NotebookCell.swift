//
//  NotebookCell.swift
//  CodeNotes2.0
//
//  Created by Komal Shrivastava on 4/21/20.
//  Copyright © 2020 Arihant Jain. All rights reserved.
//

import UIKit

class NotebookCell: UICollectionViewCell {
    @IBOutlet var notebookButton: UIButton!
    @IBOutlet var notebookLabel: UILabel!
    
//    fileprivate let label: UILabel = {
//        let l = UILabel()
//        l.text = "test"
//        return l
//    }()/Users/komals/Documents/CodeNotes/CodeNotes2.0/NotebookCell.swift
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //let label = UILabel()
        //notebookButton.setTitle("test", for: .normal)
            //arrayOfNotebooks[indexPath.row].notebookName
        //contentView.addSubview(label)
        //contentView.addSubview(notebookButton)
        //contentView.bringSubviewToFront(notebookButton)
        
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
