//
//  FeedItem.swift
//  ExchangeAGram
//
//  Created by Carl Sharman Work on 21/01/2015.
//  Copyright (c) 2015 United Learning. All rights reserved.
//

import Foundation
import CoreData

@objc (FeedItem)
class FeedItem: NSManagedObject {

    @NSManaged var caption: String
    @NSManaged var image: NSData

}
