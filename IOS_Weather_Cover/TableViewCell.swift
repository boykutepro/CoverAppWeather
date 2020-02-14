//
//  TableViewCell.swift
//  IOS_Weather_Cover
//
//  Created by Thien Tung on 2/14/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var sttIcon: UIImageView!
    
    @IBOutlet weak var highestTemp: UILabel!
    
    @IBOutlet weak var lowTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    
}
