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
    @IBOutlet var dateLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    //convert date to correct format
    func convertDate(date: Date) -> String {
        let format = DateFormatter()
        format.timeZone = .current
        format.dateFormat = "yyyy-MM-dd' at 'HH:mm a"
        let dateString = format.string(from: date)
        return dateString
    }
    
}
