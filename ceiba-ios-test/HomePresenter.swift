//
//  HomePresenter.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad()
    func prepareForRouter(user: User)
}

class HomePresenter {
    weak var view: HomeView?
    var interactor: HomeUseCase
    var router: HomeRouting
    
    init(view: HomeView, interactor: HomeUseCase, router: HomeRouting){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresentation {
    func prepareForRouter(user: User) {
        self.router.goToUserPosts(user: user)
    }
    
    func viewDidLoad() {
        self.interactor.fetchUsers(){ (result) in
            switch(result){
            case .success(let data):
                self.view?.update(data: data)
            case .failed(let error):
                print("error: \(String(describing: error))")
            }
        }
    }
}
