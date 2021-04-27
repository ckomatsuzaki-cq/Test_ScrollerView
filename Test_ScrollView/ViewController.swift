//
//  ViewController.swift
//  Test_ScrollView
//
//  Created by 小松崎千春 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var SecondTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
    }
    
    @IBAction func tapScreen(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    func createDatePicker(){
        
        datePicker.datePickerMode = .date
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        datePicker.preferredDatePickerStyle = .wheels
        
        dateTextField.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        
        dateTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneClicked(){
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @IBAction func submitButton(_ sender: Any) {
    }
}
