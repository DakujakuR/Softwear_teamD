//
//  ScheduleViewController.swift
//  Calender
//
//  Created by 謝敷宗我 on 2020/02/11.
//  Copyright © 2020 中西康之. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ScheduleViewController: UIViewController {
    @IBOutlet weak var ScheduleStack: UIStackView!
    let tset =  Tset()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "スケジュール"
    }
}
