//
//  UsersTableViewCell.swift
//  XpayBack_Assignment
//
//  Created by Viswanath on 05/02/23.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var userFullNameLbl: UILabel!
    @IBOutlet weak var userAgeLbl: UILabel!
    @IBOutlet weak var userGenderLblLbl: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        
        userImg.layer.borderWidth = 1
        userImg.layer.borderColor = UIColor.black.cgColor
        userImg.layer.cornerRadius = userImg.frame.size.width / 2
        userImg.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 10
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: bottomSpace, right: 10))
    }
}

