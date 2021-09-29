//
//  UserPostsRouter.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import UIKit

protocol UserPostsRouting {
    
}

class UserPostsRouter {
    var view: UIViewController
    
    init(view: UIViewController){
        self.view = view
    }
}

extension UserPostsRouter: UserPostsRouting {

}
