//
//  ViewController.swift
//  youtube
//
//  Created by Marwan Osama on 9/19/20.
//  Copyright © 2020 Marwan Osama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let model = Model()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getAlamofireVideos()
        
    }


}

