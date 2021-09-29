//
//  UserPostsInteractor.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import Foundation

protocol UserPostsUseCase {
    func fetchPosts(userId: Int, callback: @escaping PostRequestCompletation)
}

class UserPostsInteractor {
    
}

extension UserPostsInteractor: UserPostsUseCase {
    func fetchPosts(userId: Int,callback: @escaping PostRequestCompletation) {
        getPosts(userId: userId, callback: callback)
    }
}
