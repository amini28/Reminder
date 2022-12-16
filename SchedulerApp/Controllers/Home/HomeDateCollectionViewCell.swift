//
//  HomeDateCollectionViewCell.swift
//  SchedulerApp
//
//  Created by Amini on 28/07/22.
//

import UIKit

class HomeDateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundCell: UIView!
    @IBOutlet weak var numberDate: UILabel!
    @IBOutlet weak var dayOfDate: UILabel!
    @IBOutlet weak var selectionMark: UIImageView!
    
    static let identifier = String(describing: HomeDateCollectionViewCell.self)
    
    func setup(_ date: Date){
        backgroundCell.cornerRadius = 10
        backgroundCell.backgroundColor = .black
        
        numberDate.text = "19"
        dayOfDate.text = "Thu"
        
        selectionMark.tintColor = .black
    }
}
