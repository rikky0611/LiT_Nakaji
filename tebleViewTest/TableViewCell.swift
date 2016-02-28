//
//  TableViewCell.swift
//  tebleViewTest
//
//  Created by yuki takei on 2015/12/09.
//  Copyright © 2015年 yuki takei. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet var cellLabel:UILabel!

    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
