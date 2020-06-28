//
//  StorageManager.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/6/27.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import CoreData

@objc class StorageManager: NSObject {

    private enum Entity: String, CaseIterable {
        
        case birthYearHeavenEarthly = "BirthYearHeavenEarthly"

        case birthMonthHeavenEarthly = "BirthMonthHeavenEarthly"
        
    }

    private struct Order {

        static let createTime = "createTime"
    }

    static let shared = StorageManager()

    private override init() {

        print(" Core data file path: \(NSPersistentContainer.defaultDirectoryURL())")
        
    }

    lazy var persistanceContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "FortuneTelling")

        container.loadPersistentStores(completionHandler: { (_, error) in

            if let error = error {
                 fatalError("Unresolved error \(error)")
            }
        })

        return container
    }()

    var viewContext: NSManagedObjectContext {

        return persistanceContainer.viewContext
    }
    
    func fetchOrders() {
                        
        let request = NSFetchRequest<BirthYearHeavenEarthly>(entityName: Entity.birthYearHeavenEarthly.rawValue)
                
        print(request)

    }

}
