//
//  DayInputController.swift
//  Calender
//
//  Created by 謝敷宗我 on 2020/02/09.
//  Copyright © 2020 中西康之. All rights reserved.
//
import UIKit

class DayInputController: UITableViewController {
    @IBAction func keyboardInput(_ sender: Any) {
        
    }
    
    @IBOutlet private weak var birthdayCell: UITableViewCell!
    @IBOutlet private weak var birthdayTextField: UITextField!
    
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var datePickerContainerView: UIView!
    
    lazy private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        // 設定は省略
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // キーボードをUIDatePickerに置換え
        birthdayTextField.inputView = datePickerContainerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch tableView.cellForRow(at: indexPath) {
        case birthdayCell?:
            // UITextFieldではなくセルのタップでも入力開始する
            birthdayTextField.becomeFirstResponder()
        default:
            break
        }
    }
    
    @IBAction func datePickerDidValueChanged(picker: UIDatePicker) {
        let dateString = dateFormatter.string(from: picker.date)
        birthdayTextField.text = dateString
    }
}

extension DayInputController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        // キーボード入力や、カット/ペースによる変更を防ぐ
        return false
    }
}
