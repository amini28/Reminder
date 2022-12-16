//
//  OnboardingCollectionViewCell.swift
//  SchedulerApp
//
//  Created by Amini on 26/07/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var backgr: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(_ slide: OnboardingSlide) {
        backgr.backgroundColor = slide.color
        title.text = slide.title
        desc.text = slide.description
        imageView.image = slide.image
    }
}
