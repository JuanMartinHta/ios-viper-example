//
//  UserViewCell.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShadow(view: view)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(user: User) {
        self.name.text = user.name
        self.phone.text = user.phone
        self.email.text = user.email
    }

    override func prepareForReuse() {
        self.name.text = ""
        self.phone.text = ""
        self.email.text = ""
    }

}
