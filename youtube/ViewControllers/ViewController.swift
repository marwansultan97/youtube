//
//  ViewController.swift
//  youtube
//
//  Created by Marwan Osama on 9/19/20.
//  Copyright © 2020 Marwan Osama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModelDelegate {
    
    
    var videos : [Item]?
    let model = Model()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.getAlamofireVideos()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        persistentDarkMode()
        
        ThemeManager.addObserver(observer: self, selector: #selector(DarkMode))
        

    }
    
    


    func videoResult(response: Welcome) {
        videos = response.items
        tableView.reloadData()
    }
    
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        
        guard let video = videos?[indexPath.row] else {fatalError("error")}
        
        
        cell.setupCell(video)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToVideo", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToVideo" {
            
            let destinationVC = segue.destination as! VideoViewController
            
            let selectedindexPath = tableView.indexPathForSelectedRow
            
            let selectedVideo = videos![(selectedindexPath?.row)!]
            
            destinationVC.video = selectedVideo

        }
        
        
        
    }
    
    @objc func DarkMode() {
        
        let colorTheme = ThemeManager.currentTheme
        
        
        view.backgroundColor = colorTheme.backgroundColor
        navigationController?.navigationBar.barTintColor = colorTheme.backgroundColor
        navigationController?.navigationBar.tintColor = colorTheme.textColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : colorTheme.textColor]
        navigationController?.navigationBar.barStyle = colorTheme.barStatus
        tableView.backgroundColor = colorTheme.backgroundColor

    }
    
    func persistentDarkMode() {
        
        let colorTheme = ThemeManager.currentTheme
        
        view.backgroundColor = colorTheme.backgroundColor
        navigationController?.navigationBar.barTintColor = colorTheme.backgroundColor
        navigationController?.navigationBar.tintColor = colorTheme.textColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : colorTheme.textColor]
        navigationController?.navigationBar.barStyle = colorTheme.barStatus
    }
    
    
    
    

}

