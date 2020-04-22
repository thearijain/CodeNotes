//
//  NotebookCell.swift
//  CodeNotes2.0
//
//  Created by Komal Shrivastava on 4/21/20.
//  Copyright © 2020 Arihant Jain. All rights reserved.
//

import UIKit

//Custom Cell Class
class NotebookCell: UICollectionViewCell {
    @IBOutlet var notebookButton: UIButton!
    @IBOutlet var notebookLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
