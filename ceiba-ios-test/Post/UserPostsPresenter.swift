//
//  UserPostsPresenter.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import Foundation

protocol UserPostsPresentation {
    func viewDidLoad(userId: Int)
}

class UserPostsPresenter {
    weak var view: UserPostsView?
    var interactor: UserPostsUseCase
    var router: UserPostsRouting
    
    init(view: UserPostsView, interactor: UserPostsUseCase, router: UserPostsRouting){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension UserPostsPresenter: UserPostsPresentation {
    func viewDidLoad(userId: Int) {
        self.interactor.fetchPosts(userId: userId){ (result) in
            switch(result){
            case .success(let data):
                self.view?.update(data: data)
            case .failed(let error):
                print("error: \(String(describing: error))")
            }
        }
    }
}

