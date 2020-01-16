//
//  MenuViewController.swift
//  Calender
//
//  Created by 謝敷宗我 on 2020/01/16.
//  Copyright © 2020 中西康之. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBAction func goBack(_ segue:UIStoryboardSegue) {}
    
    @IBAction func goNext(_ sender:UIButton) {
        let next = storyboard!.instantiateViewController(withIdentifier: "SelectDayView")
        self.present(next,animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
