//
//  CustomCell.swift
//  ClickButtonOnCell
//
//  Created by Rushikesh Potdar on 01/11/22.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    var callback : (()->())?
    
    @IBAction func updateButtonPressed(_ sender: UIButton) {
        guard let closure = callback else {return}
        closure()
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
