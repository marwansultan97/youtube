//
//  Model.swift
//  youtube
//
//  Created by Marwan Osama on 9/20/20.
//  Copyright © 2020 Marwan Osama. All rights reserved.
//

import Foundation
import Alamofire


protocol ModelDelegate {
    func videoResult(response: Welcome)
}


class Model {
    
    var delegate : ModelDelegate?
    
    func getAlamofireVideos() {
        
        
        Alamofire.request(Constants.API_URL,method: .get).responseJSON { (response) in
            
            let jsonData = response.data
            
            do {
                
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                
                let welcome = try decoder.decode(Welcome.self, from: jsonData!)
                

                self.delegate?.videoResult(response: welcome)
                
            } catch {
                return
            }
        }

        
        
        
}
    
    
    
    
    
    
    

}
