//
//  MenuList.swift
//  LittleLemon
//
//  Created by Celso Lopez Martinez on 2/11/23.
//

import Foundation

struct MenuList: Decodable{
    let menu:[MenuItem]
    
    enum CodingKeys: String, CodingKey{
        case menu = "menu"
    }
    
}


