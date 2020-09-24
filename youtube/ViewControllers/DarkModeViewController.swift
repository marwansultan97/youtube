//
//  DarkModeViewController.swift
//  youtube
//
//  Created by Marwan Osama on 9/23/20.
//  Copyright © 2020 Marwan Osama. All rights reserved.
//

import UIKit


class DarkModeViewController: UIViewController {

    @IBOutlet weak var darkModeLable: UILabel!
    
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        persistentDarkMode()

        darkModeSwitch.addTarget(self, action: #selector(setDarkMode(_:)), for: .touchUpInside)
        
    }
    
    
    
    
    @objc func setDarkMode(_ toggle: UISwitch) {
        
        toggle.isOn ? ThemeManager.enableDarkMode() : ThemeManager.disableDarkMode()
        
        let colorTheme = ThemeManager.currentTheme
        
        view.backgroundColor = colorTheme.backgroundColor
        navigationController?.navigationBar.barTintColor = colorTheme.backgroundColor
        darkModeLable.textColor = colorTheme.textColor
        navigationController?.navigationBar.tintColor = colorTheme.textColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : colorTheme.textColor]
        navigationController?.navigationBar.barStyle = colorTheme.barStatus
        
    }
    
    func persistentDarkMode() {
        
        darkModeSwitch.isOn = ThemeManager.isDarkMode()
        
        let colorTheme = ThemeManager.currentTheme
        
        view.backgroundColor = colorTheme.backgroundColor
        navigationController?.navigationBar.barTintColor = colorTheme.backgroundColor
        darkModeLable.textColor = colorTheme.textColor
        navigationController?.navigationBar.tintColor = colorTheme.textColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : colorTheme.textColor]
        navigationController?.navigationBar.barStyle = colorTheme.barStatus
        
        
    }
    

    
    


}
