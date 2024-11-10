//
//  WelcomeViewController.swift
//  ConcerteApp
//
//  Created by Konstantin Kulakov on 27.10.2024.
//

import UIKit

class WelcomeViewController: CommonController {
    
    
    private func downloadCat() {
        super.downloadCat(url: "https://cataas.com/cat")
    }

    
    @IBAction func didTapButton(_ sender: Any) {
        activityIndicator.startAnimating()
        statusLabel.text = "Начинаю загрузку кота!"
        downloadCat()
    }
}

