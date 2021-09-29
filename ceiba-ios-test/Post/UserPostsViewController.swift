//
//  PostsViewController.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import UIKit

protocol UserPostsView: AnyObject {
    func update(data: [Post])
}

class UserPostsViewController: UIViewController {
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: UserPostsPresenter?
    var user: User?
    var userPosts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = user?.name
        
        self.email.text = user?.email
        self.phone.text = user?.phone

        configureCell()

        self.presenter?.viewDidLoad(userId: user!.id)
    }
}

extension UserPostsViewController : UserPostsView {
    func update(data: [Post]) {
        userPosts = data
        self.tableView.reloadData()
    }
}

extension UserPostsViewController: UITableViewDelegate {
    func configureCell(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
    }
}

extension UserPostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        let post = userPosts[indexPath.row]
        
        cell.configure(post: post)
        
        return cell
    }
}
