//
//  CategoryModel.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import Foundation
import SwiftyJSON

struct CategoryDM {
    
    
    var home_store: [HomeStoreDM]
    var best_seller: [BestSellerDM]
    
    init(json: JSON) {
        home_store = json["home_store"].arrayValue.map { HomeStoreDM(json: $0) }
        best_seller = json["best_seller"].arrayValue.map { BestSellerDM(json: $0) }
    }
}

struct HomeStoreDM {
    
    var id: Int
    var title: String
    var subtitle: String
    var picture: String
    var is_buy: Bool
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        subtitle = json["subtitle"].stringValue
        picture = json["picture"].stringValue
        is_buy = json["is_buy"].boolValue
    }
}

struct BestSellerDM {
    
    var id: Int
    var is_favorites: Bool
    var title: String
    var price_without_discount: Int
    var discount_price: Int
    var picture: String
    
    init(json: JSON) {
        id = json["id"].intValue
        is_favorites = json["is_favorites"].boolValue
        title = json["title"].stringValue
        price_without_discount = json["price_without_discount"].intValue
        discount_price = json["discount_price"].intValue
        picture = json["picture"].stringValue
        
    }
}
