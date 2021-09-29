//
//  PostTableViewCell.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(post: Post) {
        self.title.text = post.title
        self.body.text = post.body
    }

    override func prepareForReuse() {
        self.title.text = ""
        self.body.text = ""
    }
    
}
