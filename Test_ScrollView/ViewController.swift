//
//  ViewController.swift
//  Test_ScrollView
//
//  Created by 小松崎千春 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let datePicker = UIDatePicker()
    let toolbar = UIToolbar()
    let dateFormatter = DateFormatter()
    
    struct CellData {
        var title: String
    }
    
    // データを作る
    var cells: [CellData] = [
        CellData(title: "TextFieldCell"),
        CellData(title: "DatePickerCell"),
        CellData(title: "ButtonCell")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "TextFieldCell")
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DatePickerCell")
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ButtonCell")
        
        createDatePicker()
    }
    
    // 表示するセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    // 各セルを生成して返却
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = cells[indexPath.row].title
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        // セルの枠線
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        
        setSubView(cell: cell, identifier: identifier)
        
        return cell
        
    }
    
    func setSubView(cell: UICollectionViewCell, identifier: String) {
        switch identifier {
        case "TextFieldCell":
            let textField = setUpTextField(textField: UITextField())
            cell.contentView.addSubview(textField)
        case "DatePickerCell":
            let textField = setUpTextField(textField: UITextField())
            textField.inputView = datePicker
            textField.inputAccessoryView = toolbar
            textField.text = dateFormatter.string(from: datePicker.date)
            cell.contentView.addSubview(textField)
        case "ButtonCell":
            let button = setUpButton(button: UIButton())
            cell.contentView.addSubview(button)
        default:
            return
        }
    }
    
    // UICollectionViewの外周余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // Cellのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(1000), height: CGFloat(100))
    }
    // 行の最小余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 300
    }
    // 列の最小余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func setUpTextField(textField: UITextField) -> UITextField{
        textField.frame = CGRect(x: 0, y: 32, width: 1000, height: 32)
        textField.placeholder = "ここに入力"
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        
        return textField
    }
    
    func setUpButton(button: UIButton) -> UIButton{
        button.frame = CGRect(x: 450, y: 32, width: 120, height: 40)
        button.setTitle("Submit", for: UIControl.State.normal)
        button.backgroundColor = UIColor.blue
        
        return button
    }
    
    func createDatePicker(){
        
        datePicker.datePickerMode = .date
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        datePicker.preferredDatePickerStyle = .wheels
        
        
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
    }
    
    @objc func doneClicked(){
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        self.view.endEditing(true)
    }
    
    @IBAction func tappedScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
