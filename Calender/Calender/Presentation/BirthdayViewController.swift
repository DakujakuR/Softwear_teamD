//
//  DateInputViewController.swift
//  Calender
//
//  Created by 謝敷宗我 on 2020/02/09.
//  Copyright © 2020 中西康之. All rights reserved.
//


import UIKit

class DateInputViewController: UIViewController {
    
    //紐づけ
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Picker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GetDate(_ sender: Any) {
        Label.text = "\(Picker.date)"
        
    }
    
    
}
