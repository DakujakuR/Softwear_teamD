//
//  Event.swift
//  Calender
//
//  Created by 373watohk on 2019/12/28.
//  Copyright © 2019 中西康之. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {

    @objc dynamic var date: String = ""
    @objc dynamic var event: String = ""

}
