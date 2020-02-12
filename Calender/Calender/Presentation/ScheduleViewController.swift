//
//  ScheduleViewController.swift
//  Calender
//
//  Created by 謝敷宗我 on 2020/02/11.
//  Copyright © 2020 中西康之. All rights reserved.
//

//import Foundation
import UIKit
import RealmSwift

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // テーブルビュー
    @IBOutlet weak var tableView: UITableView!
    
    // セルに表示する文字を格納する配列
    var data:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // テーブルビューのdataSourceとdelegateを設定
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    // テーブルビューのセル数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // テーブルビューに表示するセルを設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    /*
    @IBAction func onAdd(_ sender: Any) {
        
        let alert: UIAlertController = UIAlertController(title: "セルを追加", message: "追加したい文字列を記入してください", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(configurationHandler: nil)
        let okAction =
            UIAlertAction(title: "OK",
                          style: UIAlertAction.Style.default,
                          handler:{
                            (action: UIAlertAction) -> Void in
                            self.data.insert(alert.textFields!.first!.text!, at: 0)
                            // <ポイント>
                            self.tableView.beginUpdates()
                            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)],
                                                      with: .automatic)
                            self.tableView.endUpdates()
                            // </ポイント>
            })
        let cancelAction = UIAlertAction(title: "キャンセル",
                                         style: UIAlertAction.Style.cancel,
                                         handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }*/
}

/*
class ScheduleViewController: UIViewController {
    //スケジュールのViewTableを紐付け
    @IBOutlet weak var ScheduleTable: UITableView!
    @IBOutlet weak var ScheduleTableCell: UITableViewCell!
    
    //Realmの中身を格納する変数
    var todoItemList: Results<Tset>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "スケジュール"
        
        //realmインスタンス生成
        let realm = try! Realm()
        
        //Realmの中身全て取得
        self.todoItemList = realm.objects(Tset.self)
        var i=0
        for user in todoItemList{
            print("スケジュール。保存されたタイトル\(i)つめ：" + user.contentTitle )
            i = i + 1
        }
        
        /*
         self.ScheduleTable.reloadData()
         
         var newTableCell = ScheduleTableCell
         
         newTableCell?.textLabel = "あいうえお"
         
         
         ScheduleTable.addSubview(newTableCell)
         //ScheduleTable.dataSource = self
         //ScheduleTable.delegate = self
         */
    }
}


//ScheduleViewControllerクラスを拡張
extension ScheduleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.todoItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Tsetモデルクラス型の変数を宣言
        let tableCell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "テストセル", for: indexPath)
        
        let todoItem:Tset = self.todoItemList[(indexPath as NSIndexPath).row];
        
        tableCell.textLabel?.text = todoItem.contentTitle
        
        return tableCell
    }
    
}
*/
