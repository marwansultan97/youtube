//
//  VideoTableViewCell.swift
//  youtube
//
//  Created by Marwan Osama on 9/21/20.
//  Copyright © 2020 Marwan Osama. All rights reserved.
//

import UIKit
import SDWebImage

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var videoTitlelable: UILabel!
    
    @IBOutlet weak var videoDateLable: UILabel!
    
    var video : Item?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ v: Item) {
        
        video = v
        
        videoTitlelable.text = v.snippet.title
        
        let df = DateFormatter()
        
        df.dateFormat = "EEEE, MMM d, yyyy"
        
        videoDateLable.text = df.string(from: v.snippet.publishedAt)
        
        guard let url = URL(string: v.snippet.thumbnails.high.url) else {return}
        
        thumbnailImageView.sd_setImage(with: url)
        
        persistentDarkMode()
        
        ThemeManager.addObserver(observer: self, selector: #selector(DarkMode))
    }
    
    @objc func DarkMode() {
        
        let colorTheme = ThemeManager.currentTheme
        
        
        backgroundColor = colorTheme.backgroundColor
        videoDateLable.textColor = colorTheme.textColor
        videoTitlelable.textColor = colorTheme.textColor
        
        
    }
    
    func persistentDarkMode() {
        
        let colorTheme = ThemeManager.currentTheme
        
        
        backgroundColor = colorTheme.backgroundColor
        videoDateLable.textColor = colorTheme.textColor
        videoTitlelable.textColor = colorTheme.textColor
    }
    
    

}
