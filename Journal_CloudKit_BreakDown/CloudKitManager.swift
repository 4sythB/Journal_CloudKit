//
//  CloudKitManager.swift
//  Journal_CloudKit_BreakDown
//
//  Created by Diego Aguirre on 8/7/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

class CloudKitManager {
    
    let database = CKContainer.defaultContainer().publicCloudDatabase
    
    func fetchRecordsWithType(type: String, sortDescriptors: [NSSortDescriptor]? = nil, completion: ([CKRecord]?, NSError?) -> Void) {
        
        let query = CKQuery(recordType: type, predicate: NSPredicate(value: true))
        query.sortDescriptors = sortDescriptors
        
        database.performQuery(query, inZoneWithID: nil, completionHandler: completion)
    }
    
    func saveRecord(record: CKRecord, completion: ((NSError?) -> Void) = {_ in }) {

        database.saveRecord(record) { (_, error) in
            completion(error)
        }
    }
}