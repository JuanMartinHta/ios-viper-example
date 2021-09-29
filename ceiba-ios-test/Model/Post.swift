//
//  Post.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import Foundation
import Alamofire

// MARK: - Post
struct Post: Codable {
    let userId, id: Int
    let title, body: String
}
