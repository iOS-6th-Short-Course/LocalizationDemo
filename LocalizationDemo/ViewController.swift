//
//  ViewController.swift
//  LocalizationDemo
//
//  Created by Chhaileng Peng on 1/26/19.
//  Copyright © 2019 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var changeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeLanguage), name: NSNotification.Name("languageChanged"), object: nil)
        
        changeLanguage()
    }
    
    @objc func changeLanguage() {
        welcomeLabel.text = "welcome".localized
        changeButton.setTitle("change language".localized, for: .normal)
    }

    @IBAction func changeLang(_ sender: Any) {
        if LanguageManager.shared.languauge == "km" {
            LanguageManager.shared.languauge = "en"
        } else {
            LanguageManager.shared.languauge = "km"
        }
        
        // refresh app to affect the language chagned
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let homeScreen = storyboard?.instantiateInitialViewController()
//        appDelegate.window?.rootViewController = homeScreen
        
        // Post a notification via observer to all screen
        NotificationCenter.default.post(name: NSNotification.Name("languageChanged"), object: nil)
    }
    
    
    
}

