//
//  ViewController.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import UIKit

protocol HomeView: AnyObject {
    func update(data: [User])
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenter?
    var usersData: [User] = []
    var filterUsers: [User] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Usuarios"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        configureTableView()
        self.presenter?.viewDidLoad()
    }
}

extension HomeViewController : HomeView {
    func update(data: [User]) {
        usersData = data
        filterUsers = data
        self.tableView.reloadData()
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterUsers = []
            
            if searchText == "" { filterUsers = usersData }
            
            for user in usersData {
                if user.name.uppercased().contains(searchText.uppercased()){
                    filterUsers.append(user)
                }
            }
            
            self.tableView.reloadData()
        }
    }

}

extension HomeViewController: UITableViewDelegate {
    func configureTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let user = filterUsers[indexPath.row]
        
        cell.configure(user: user)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.prepareForRouter(user: filterUsers[indexPath.row])
    }
    
}
