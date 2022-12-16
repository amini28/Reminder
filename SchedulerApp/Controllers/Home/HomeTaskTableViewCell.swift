//
//  HomeTaskTableViewCell.swift
//  SchedulerApp
//
//  Created by Amini on 28/07/22.
//

import UIKit

class HomeTaskTableViewCell: UITableViewCell {

    static let identifier = String(describing: HomeTaskTableViewCell.self)
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tasksLabel: UILabel!
    @IBOutlet weak var backgroundTaskView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ task: Task){
        timeLabel.text = "10:00 AM"
        tasksLabel.text = task.title
        backgroundTaskView.backgroundColor = .black
        backgroundTaskView.cornerRadius = 10
    }

}
