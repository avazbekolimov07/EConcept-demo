//
//  MyCartModel.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import Foundation
import SwiftyJSON

struct MyCartModel {
    
    var basket: [BasketDM]
    
    var delivery: String
    var id: String
    var total: Int
    
    init(json: JSON) {
        basket = json["basket"].arrayValue.map { BasketDM(json: $0) }
        
        delivery = json["delivery"].stringValue
        id = json["id"].stringValue
        total = json["total"].intValue
    }
    
    
}

struct BasketDM {
    
    var id: Int
    var images: String
    var price: Int
    var title: String
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        price = json["price"].intValue
        images = json["images"].stringValue
        
    }
}
