//
//  User.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import Foundation
import Alamofire

// MARK: - User
struct User: Codable {
    let id: Int
    let name, username, email: String
    let phone: String
}
