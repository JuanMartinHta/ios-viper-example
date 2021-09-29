//
//  Users.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import Foundation
import Alamofire
import CoreData

enum UsersResult {
    case success(data: [User])
    case failed(error: String?)
}

typealias UsersRequestCompletation = (_ result: UsersResult)->()

func getUsers(callback: @escaping UsersRequestCompletation) {
    
    let manager = CoreDataManager()
    
    
    let url = "https://jsonplaceholder.typicode.com/users"
    Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseDecodable { (response: DataResponse<[User]>) in
        
        if let users = response.value {
            callback(UsersResult.success(data: users))
        } else {
            callback(UsersResult.failed(error: "Error al obtener los usuarios"))
        }
    }
}

func getLocalUsers() -> User{
    let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
    do {
  
        //2
        let result = try container.viewContext.fetch(fetchRequest)
        return result
    } catch {
        print(“El error obteniendo usuario(s) \(error)”)
     }
 
      //3
     return []
}
