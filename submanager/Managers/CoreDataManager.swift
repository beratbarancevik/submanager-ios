//
//  CoreDataManager.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import CoreData

typealias CoreDataResult = (Result<Void, Error>) -> Void

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.coreDataSubsciptionsContainer)
        container.loadPersistentStores(completionHandler: { _, _ in })
        return container
    }()
    
    // MARK: - Setup
    private init() {}
    
    // MARK: - CRUD Functions
    func getSubscriptions(completion: @escaping (Result<[Subscription], Error>) -> Void) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: String(describing: Subscription.self))
        do {
            let managedObjects = try container.viewContext.fetch(fetchRequest)
            let subscriptions = managedObjects.map { Subscription(managedObject: $0) }
            completion(Result.success(subscriptions))
        } catch {
            completion(Result.failure(error))
        }
    }
    
    func saveSubscription(_ subscription: Subscription, completion: @escaping CoreDataResult) {
        let context = container.newBackgroundContext()
        guard let entity = NSEntityDescription.entity(forEntityName: String(describing: Subscription.self), in: context) else {
            completion(Result.failure(CoreDataError.unknown))
            return
        }
        let managedObject = NSManagedObject(entity: entity, insertInto: context)
        let newSubscription = subscription.generateManagedObject(from: managedObject)
        context.insert(newSubscription)
        saveChanges(context: context) { result in
            completion(result)
        }
    }
    
    func updateSubscription(_ subscription: Subscription, completion: @escaping CoreDataResult) {
        let context = container.newBackgroundContext()
        // TODO: update
        saveChanges(context: context) { result in
            completion(result)
        }
    }
    
    func deleteSubscription(_ subscription: Subscription, completion: @escaping CoreDataResult) {
//        let context = container.newBackgroundContext()
//        context.delete(subscription)
//        saveChanges(context: context) { result in
//            completion(result)
//        }
    }
    
    func saveChanges(context: NSManagedObjectContext, completion: @escaping CoreDataResult) {
        context.perform {
            do {
                try context.save()
                completion(Result.success(()))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
}

// MARK: - CoreDataError
enum CoreDataError: Error {
    case unknown
}
