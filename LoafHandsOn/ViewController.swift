//
//  ViewController.swift
//  LoafHandsOn
//
//  Created by 大林拓実 on 2020/09/20.
//  Copyright © 2020 Obayashi Takumi. All rights reserved.
//

import UIKit
import Loaf

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
        
        if inputText!.isEmpty {
            // Loafで警告トーストを表示
            Loaf("1文字以上入力してください", state: .error, sender: self).show()
        }
        else {
            userDefaults.setValue(inputText, forKey: "SaveText")
            print("inputText: \(inputText!)")

            // 保存できたらLoafでトーストを表示
            Loaf("保存されました", state: .success, sender: self).show()
        }
    }
    
    @IBAction func loadText() {
        // UserDefaultsから読み出してdisplayTextLabelに表示する
        let displayText = userDefaults.string(forKey: "SaveText")
        print("displayText: \(displayText!)")
        displayLabel.text = displayText
        
        // 読み出したらLoafでトーストを表示
        Loaf("読み出しました", state: .info, sender: self).show()
    }

}

