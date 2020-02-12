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

class Tset: Object {
    @objc dynamic var id = 0
    @objc dynamic var contentTitle = ""
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
    @IBOutlet weak var ContentTitle: UITextField!
    @IBOutlet weak var Content: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "スケジュールの追加"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //追加ボタンを押した時の処理
    @IBAction func GetDate(_ sender: Any) {
        let s = Tset()
        s.contentTitle = ContentTitle.text!
        s.content = Content.text!
        
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let calendar = Calendar.current
        
        
        //datepicker1
        let dateStr = "\(Picker.date)"
        let date = DateUtils.dateFromString(string: dateStr, format: "yyyy/MM/dd HH:mm:ss Z")
        
        let save_date = calendar.date(byAdding: .hour, value: 9, to: date)!
        print(save_date)
        //let save_date_str = f.string(from: Calendar.current.date(byAdding: .day, value: 0, to: save_date)!)
        //save_date = f.date(from: save_date_str)!
        //print(save_date)
        
        
        
        //datepicker2
        let dateStr2 = "\(Picker2.date)"
        let date2 = DateUtils.dateFromString(string: dateStr2, format: "yyyy/MM/dd HH:mm:ss Z")
        
        let save_date2 = calendar.date(byAdding: .hour, value: 9, to: date2)!
        print(save_date2)
        
        //日付情報をString型に変更
        /*var save_date2 = Calendar.current.date(byAdding: .hour, value: 9, to: date2)!
         save_date2 = Calendar.current.date(byAdding: .day, value: -1, to: save_date2)!
         print(save_date2)*/
        
        print("タイトル：" + ContentTitle.text!)
        print("概要：" + Content.text!) //self.navigationController?.popToRootViewController(animated: true)
        
        
        //realm
        /*
         let realm = try! Realm()
         let person = Tset()
         person.id = 2
         
         
         try! realm.write {
         realm.add(person)
         }
         
         for user in realm.objects(Persons.self){
         print(user.name)
         }
         */
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(s)
                print("ToDo Saved")
            })
            
            var i=0
            for user in realm.objects(Tset.self){
                print("保存されたタイトル\(i)つめ：" + user.contentTitle )
                i = i + 1
            }
            
        }catch{
            print("Save is Faild")
        }
        //let realm = try! Realm()
        
        
        self.navigationController?.popViewController(animated: true)
    }
}
