//
//  CoreDataProtocols.swift
//  DriveRecords
//
//  Created by Hamza Khan on 08/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation

/// TodoListPersistenceManagerInputDelegate has two functions
/// retrieveTodoItems: Gets the todos from the local store
/// save: Saves a todo item to the local store
protocol RideRecordListPersistenceManagerInputDelegate: class {
    func retrieveTodoList() throws -> [RideRecord]
    func save(item: RideRecord) throws
}

/// TodoListPersistenceManagerOutputDelegate has two functions
/// onTodoItemsRetrieved: Called when you get back items from the local store
/// onError: If there is an error in retrieving those items
protocol RideRecordListPersistenceManagerOutputDelegate: class {
    func didRetrieveTodos(_ records: [RideRecord])
    func onError()
}
