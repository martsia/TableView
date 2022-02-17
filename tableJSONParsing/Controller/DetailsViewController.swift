//
//  DetailsViewController.swift
//  tableJSONParsing
//
//  Created by Marta Kalichynska on 14.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var post: Post!
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdLabel.text = "User id: " + String(post.userId)
        idLabel.text = "Id: " + String(post.id)
        titleLabel.text = "Title: " + post.title
        bodyLabel.text = "Body: " + post.body
        
    }
    
}
