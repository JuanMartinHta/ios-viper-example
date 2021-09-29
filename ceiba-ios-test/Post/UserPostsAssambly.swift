//
//  UserPostsAssambly.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import UIKit

class UserPostAssembly {
    static func buil(data: User) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "UserPostsViewController") as! UserPostsViewController
        
        let interator = UserPostsInteractor();
        let router = UserPostsRouter(view: view)
        let presenter = UserPostsPresenter(view: view, interactor: interator, router: router)
        
        view.presenter = presenter
        view.user = data
         
        return view
    }
}
