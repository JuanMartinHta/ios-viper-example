//
//  HomeInteractor.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import Foundation

protocol HomeUseCase {
    func fetchUsers(callback: @escaping UsersRequestCompletation)
}

class HomeInteractor {
    
}

extension HomeInteractor: HomeUseCase {
    func fetchUsers(callback: @escaping UsersRequestCompletation) {
        getUsers(callback: callback)
    }
}
