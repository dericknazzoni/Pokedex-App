//
//  CustomViewCellTableViewCell.swift
//  Pokedex-Api
//
//  Created by Derick Willians Plens Nazzoni on 23/07/19.
//  Copyright © 2019 Derick Willians Plens Nazzoni. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
