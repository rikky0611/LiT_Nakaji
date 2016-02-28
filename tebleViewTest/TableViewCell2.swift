//
//  TableViewCell2.swift
//  tebleViewTest
//
//  Created by Tsubasa NAKAJIMA on H28/01/20.
//  Copyright © 平成28年 yuki takei. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {

    @IBOutlet var cellLabel:UILabel!
    @IBOutlet weak var cellImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellLabel.sizeToFit()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
