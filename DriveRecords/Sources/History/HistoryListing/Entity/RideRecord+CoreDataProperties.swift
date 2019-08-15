





import Foundation
import CoreData

extension RideRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RideRecord> {
        return NSFetchRequest<RideRecord>(entityName: "RideRecord")
    }
  
    func toggleCompleted() {
      completed = !completed
    }

    @NSManaged public var date: Date?
    @NSManaged public var distance: String?
    @NSManaged public var duration: String?
    @NSManaged public var studentName: String?
    @NSManaged public var completed: Bool

}
