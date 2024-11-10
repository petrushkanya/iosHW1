//
//  CommonController.swift
//  ConcerteApp
//
//  Created by Патрушева Анна Алексеевна on 10.11.2024.
//

import UIKit

class CommonController: UIViewController {
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusLabel.text = "Готов к загрузке!"
        activityIndicator.hidesWhenStopped = true
    }
    
    func downloadCat(url: String, onFinish:(() -> Void)? = nil) {
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.catImageView.image = UIImage(data: data)
                self?.statusLabel.text = "Загрузка кота закончена"
                self?.activityIndicator.stopAnimating()
                onFinish?()
            }
        }
        
        task.resume()
    }
}
