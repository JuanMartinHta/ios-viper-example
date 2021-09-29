//
//  CoreDataManager.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import Foundation
import CoreData

class CoreDataManager {
    private let container : NSPersistentContainer!

    init() {
        container = NSPersistentContainer(name: "UsersDataModel")
        setupDatabase()
    }
    
    private func setupDatabase() {
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) — \(error)")
                return
            }
            
            print("Database ready!")
        }
    }
}
