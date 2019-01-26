//
//  HomeScreenViewController.swift
//  LocalizationDemo
//
//  Created by Chhaileng Peng on 1/26/19.
//  Copyright © 2019 Chhaileng Peng. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var homeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(changeLanguage), name: NSNotification.Name("languageChanged"), object: nil)
        changeLanguage()
    }
    
    @objc func changeLanguage() {
        homeLabel.text = "home".localized
        
        tabBarController?.tabBar.items?[0].title = "home".localized
        tabBarController?.tabBar.items?[1].title = "welcome".localized
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
