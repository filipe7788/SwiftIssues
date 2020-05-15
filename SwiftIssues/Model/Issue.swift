//
//  Issue.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import Foundation

class Issue: Codable {
    var title: String = ""
    var state: String = ""
    var description: String = ""
    var createdDate: String = ""
    var urlAcess: String = ""
    var author: User = User(name: "", avatarURL: "")
    
    init() {}
        
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case state = "state"
        case description = "body"
        case createdDate = "created_at"
        case urlAcess = "html_url"
        case author = "user"
    }
    
}
