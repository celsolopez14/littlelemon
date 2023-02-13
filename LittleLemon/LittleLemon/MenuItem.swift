//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Celso Lopez Martinez on 2/11/23.
//

import Foundation

struct MenuItem: Decodable, Hashable, Identifiable{
    let id:Int
    let title:String
    let image:String
    let price:String
    let itemDescription:String
    let category:String
    
    enum CodingKeys: String,  CodingKey{
        case id = "id"
        case title = "title"
        case image = "image"
        case price = "price"
        case itemDescription = "description"
        case category = "category"
    }
}
