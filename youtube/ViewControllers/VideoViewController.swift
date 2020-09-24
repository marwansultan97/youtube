//
//  VideoViewController.swift
//  youtube
//
//  Created by Marwan Osama on 9/21/20.
//  Copyright © 2020 Marwan Osama. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    
    
    @IBOutlet weak var dateLable: UILabel!
    
    
    @IBOutlet weak var videoWebView: WKWebView!
    
    
    @IBOutlet weak var descriptionView: UITextView!
    
    
    var video : Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        persistentDarkMode()
        
        ThemeManager.addObserver(observer: self, selector: #selector(DarkMode))
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleLable.text = ""
        dateLable.text = ""
        descriptionView.text = ""
        
        guard video != nil else {
            return
        }
        
        // Set Video View
        let embedURLString = Constants.embedURL + video!.snippet.resourceID.videoID
        
        let embedURL = URL(string: embedURLString)
        
        let requestURL = URLRequest(url: embedURL!)
        
        videoWebView.load(requestURL)
        
        // Set Title
        titleLable.text = video?.snippet.title
        
        // Set Date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        
        let date =  df.string(from: (video?.snippet.publishedAt)!)
        
        dateLable.text = date
        
        // Set Video Description
        descriptionView.text = video?.snippet.snippetDescription
        
        
    }
    
    
    @objc func DarkMode() {
        
        let colorTheme = ThemeManager.currentTheme
        
        view.backgroundColor = colorTheme.backgroundColor
        titleLable.textColor = colorTheme.textColor
        dateLable.textColor = colorTheme.textColor
        descriptionView.textColor = colorTheme.textColor
        descriptionView.backgroundColor = colorTheme.backgroundColor
        
        
    }
    
    func persistentDarkMode() {
        
        let colorTheme = ThemeManager.currentTheme
        
        view.backgroundColor = colorTheme.backgroundColor
        titleLable.textColor = colorTheme.textColor
        dateLable.textColor = colorTheme.textColor
        descriptionView.textColor = colorTheme.textColor
        descriptionView.backgroundColor = colorTheme.backgroundColor

        
    }
    



}
