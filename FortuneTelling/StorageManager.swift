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
        
        case record = "UserRecord"
        
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
    
    func saveContext() {
        
        let context = persistanceContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
            
            } catch {
             
                let error = error as NSError
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            
            }
            
        }
        
    }
    
    func read() -> [UserRecord] {
        
        let request: NSFetchRequest<UserRecord> = UserRecord.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(key: "createTime", ascending: false)]
        
        var result: [UserRecord] = []
        
        do {
            
            result = try viewContext.fetch(request)
            
        } catch {
            
            print(error)
            
        }
        
        return result
        
    }
    
    func create(lastname: String, firstname: String, gender: String, solarBirth: String) {
        
        guard let user = NSEntityDescription.insertNewObject(forEntityName: "UserRecord", into: viewContext) as? UserRecord else {return}
        
        user.lastname = lastname
        
        user.firstname = firstname
        
        user.gender = gender
        
        user.solarBirth = solarBirth
                
        user.createTime = Date()
        
        saveContext()
        
    }
        
    func remove(indexPathRow: Int) {
        
        let results = read()
        
        viewContext.delete(results[indexPathRow])
        
        saveContext()
        
    }

}
