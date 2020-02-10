//
//  DateInputViewController.swift
//  Calender
//
//  Created by 謝敷宗我 on 2020/02/09.
//  Copyright © 2020 中西康之. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Persons: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
}
class User: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var createdAt: Double = 0
}

class Tset: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var content = ""
    @objc dynamic var start_time: Double = 0
    @objc dynamic var end_time: Double = 0
    @objc dynamic var delete_flg = 0
}

class DateUtils {
    class func dateFromString(string: String, format: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }

    class func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

class DateInputViewController: UIViewController {
    
    //紐づけ
    
    
    @IBOutlet weak var Picker: UIDatePicker!
    @IBOutlet weak var Picker2: UIDatePicker!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GetDate(_ sender: Any) {
        let calendar = Calendar.current
        

        //datepicker1
        let dateStr = "\(Picker.date)"
        let date = DateUtils.dateFromString(string: dateStr, format: "yyyy/MM/dd HH:mm:ss Z")
        let save_date = Calendar.current.date(byAdding: .hour, value: 9, to: date)!
        print(calendar.component(.year, from: save_date))

        Label.text = DateUtils.stringFromDate(date: date, format: "yyyy年MM月dd日 HH時mm分ss秒 Z")
        //self.navigationController?.popToRootViewController(animated: true)
        
        //datepicker2
        let dateStr2 = "\(Picker2.date)"
        let date2 = DateUtils.dateFromString(string: dateStr2, format: "yyyy/MM/dd HH:mm:ss Z")
        
        let save_date2 = Calendar.current.date(byAdding: .hour, value: 9, to: date2)!
        print(save_date2)
        print(calendar.component(.month, from: save_date2))
        print(calendar.component(.day, from: save_date2))
        Label.text = DateUtils.stringFromDate(date: date2, format: "yyyy年MM月dd日 HH時mm分ss秒 Z")
        //self.navigationController?.popToRootViewController(animated: true)
        
        /*let realm = try! Realm()
        let person = Tset()
        person.id = 2


        try! realm.write {
            realm.add(person)
        }
        
        for user in realm.objects(Persons.self){
            print(user.name)
        }*/
        
    }
}
