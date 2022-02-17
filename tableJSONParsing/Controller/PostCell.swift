//
//  PostCell.swift
//  tableJSONParsing
//
//  Created by Marta Kalichynska on 15.02.2022.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var postTitleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postTitleLabel.text = ""
    }
    
    func configure(post: Post) {
        postTitleLabel.text = post.title
    }
}
