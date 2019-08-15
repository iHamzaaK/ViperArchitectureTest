//
//  RideRecordLocalDataManager.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import CoreData
class RideRecordLocalDataManager: RideRecordListPersistenceManagerInputDelegate {
    
    let managedObjectContext = PersistenceService.context
    
    func retrieveTodoList() throws -> [RideRecord] {
        let request: NSFetchRequest<RideRecord> = RideRecord.fetchRequest()
        return try managedObjectContext.fetch(request)
    }
    
    func save(item: RideRecord) throws {
        let todoItem = RideRecord(context: managedObjectContext)
        todoItem.completed = item.completed
        todoItem.date = item.date
        todoItem.distance = item.distance
        todoItem.duration = item.duration
        todoItem.studentName = item.studentName
        todoItem.completed = item.completed
        try managedObjectContext.save()
    }
}
