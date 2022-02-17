//
//  MyTableViewController.swift
//  tableJSONParsing
//
//  Created by Marta Kalichynska on 14.02.2022.
//

import UIKit

class PostsListViewController: UIViewController {
    @IBOutlet weak var postsTableView: UITableView!
    
    var posts: [Post] = []
    var dataManager: PostsProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager = DataManager()
        configuredTableView()
        loadData()
    }
    
    func configuredTableView() {
        postsTableView.estimatedRowHeight = UITableView.automaticDimension
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.tableFooterView = UIView()
    }
    
    func loadData() {
        dataManager.getPosts { [weak self] posts in
            self?.posts = posts
            self?.postsTableView.reloadData()
        } onError: { [weak self] error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okButton)
            self?.present(alert, animated: true)
        }
    }
    
}

extension PostsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.configure(post: posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        detailsVC.post = post
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
