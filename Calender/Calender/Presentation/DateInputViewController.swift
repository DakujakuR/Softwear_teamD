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
    dynamic var name = ""
    dynamic var date : Double = 0
}
class User: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var createdAt: Double = 0
    @objc dynamic var aiueo = 0
}

class DateInputViewController: UIViewController {
    
    //紐づけ
    
    
    @IBOutlet weak var Picker: UIDatePicker!
    @IBOutlet weak var Label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "予定の追加"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GetDate(_ sender: Any) {
        let realm = try! Realm()
        /*
        //default.realmの場所を確認
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        */
        print(realm)
        
        let tanaka = User()
        tanaka.id = 1
        tanaka.name = "田中"
        tanaka.createdAt = NSDate().timeIntervalSince1970
        tanaka.aiueo = 1
        try! realm.write {
            realm.add(tanaka)
        }
        
        for user in realm.objects(User.self){
            print(user.name)
        }
        Label.text = "\(Picker.date)"
    }
    
    
}
