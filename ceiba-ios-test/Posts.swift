//
//  Posts.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import Foundation
import Alamofire

enum PostsResult {
    case success(data: [Post])
    case failed(error: String?)
}

typealias PostRequestCompletation = (_ result: PostsResult)->()

func getPosts(userId: Int, callback: @escaping PostRequestCompletation) {
    let url = "https://jsonplaceholder.typicode.com/posts"
    Alamofire.request(url, method: .get, parameters: ["userId": userId], encoding: URLEncoding.queryString).responseDecodable { (response: DataResponse<[Post]>) in
        
        print(response)
        
        if let posts = response.value {
            callback(PostsResult.success(data: posts))
        } else {
            callback(PostsResult.failed(error: "Error al obtener los post"))
        }
    }
}
