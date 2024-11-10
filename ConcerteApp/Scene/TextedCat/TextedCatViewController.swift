//
//  TextedCatViewController.swift
//  ConcerteApp
//
//  Created by Патрушева Анна Алексеевна on 10.11.2024.
//

import UIKit

class TextedCatViewController: CommonController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var downloadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadButton.isEnabled = true
        textField.isEnabled = true
    }
    
    private func downloadCat(with text: String) {
        let finish = text.isEmpty ? "" : "/says/\(text)?fontSize=50&fontColor=white"
        
        super.downloadCat(url: "https://cataas.com/cat" + finish, onFinish: {self.downloadButton.isEnabled = true
            self.textField.isEnabled = true})
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        downloadButton.isEnabled = false
        textField.isEnabled = false
        activityIndicator.startAnimating()
        statusLabel.text = "Начинаю загрузку кота с текстом!"
        downloadCat(with: textField.text!)
    }
}

