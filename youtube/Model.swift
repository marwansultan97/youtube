//
//  Model.swift
//  youtube
//
//  Created by Marwan Osama on 9/20/20.
//  Copyright © 2020 Marwan Osama. All rights reserved.
//

import Foundation


class Model {
    
    
    func getVideos() {
        
        guard let url = URL(string: Constants.API_URL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if err != nil || data == nil {
                return
            } else {
                
                var i = 0
                
                
                
            }
            
            
            
            
            
            
            
        }.resume()
        
        
        
        
        
    }
    
    
    
    
    
    
    
}
