//
//  CustomTableViewCell.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 24/05/2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("From subclass")
    }

    func configureCell() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
