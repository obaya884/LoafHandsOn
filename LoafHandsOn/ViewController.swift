//
//  ViewController.swift
//  LoafHandsOn
//
//  Created by 大林拓実 on 2020/09/20.
//  Copyright © 2020 Obayashi Takumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.text = "保存した文字列を読み出そう"
        inputTextField.text = ""
        
        loadText()
    }

    @IBAction func saveText() {
        // inputTextFieldの入力内容をUserDefaultsに保存する
        let inputText = inputTextField.text
        userDefaults.setValue(inputText, forKey: "SaveText")
        print("inputText: \(inputText!)")

        // 保存できたらアラートを表示
        let saveAlert = UIAlertController(title: "保存完了", message: "文字列が保存されました", preferredStyle: .alert)
        saveAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(saveAlert, animated: true, completion: nil)
    }
    
    @IBAction func loadText() {
        // UserDefaultsから読み出してdisplayTextLabelに表示する
        let displayText = userDefaults.string(forKey: "SaveText")
        print("displayText: \(displayText!)")
        displayLabel.text = displayText
        
        // 読み出したらアラートを表示
        let loadAlert = UIAlertController(title: "読み出し完了", message: "文字列を読み出しました", preferredStyle: .alert)
        loadAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(loadAlert, animated: true, completion: nil)
    }

}
