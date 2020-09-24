//
//  ConstantsTemplate.swift
//  youtube
//
//  Created by Marwan Osama on 9/24/20.
//  Copyright © 2020 Marwan Osama. All rights reserved.
//

import Foundation

struct ConstantsTemplate {
    
    // Your Api Key
    static let API_KEY = ""
    // The youtube Playlist ID
    static var PLAYLIST_ID = ""
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(ConstantsTemplate.PLAYLIST_ID)&key=\(ConstantsTemplate.API_KEY)"
    
    static var embedURL = "https://www.youtube.com/embed/"

}
