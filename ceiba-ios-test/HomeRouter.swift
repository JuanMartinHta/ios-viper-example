//
//  HomeRouter.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import UIKit

protocol HomeRouting {
    func goToUserPosts(user: User)
}

class HomeRouter {
    var view: UIViewController
    
    init(view: UIViewController){
        self.view = view
    }
}

extension HomeRouter: HomeRouting {
    func goToUserPosts(user: User) {
        let viewController = UserPostAssembly.buil(data: user)
        self.view.navigationController?.pushViewController(viewController, animated: true)
    }
}
