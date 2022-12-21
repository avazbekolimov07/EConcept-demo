//
//  ProductModel.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import Foundation
import SwiftyJSON

struct ProductModel {
    
    
    var cpu: String
    var camera: String
    var capacity: [String]
    var color: [String]
    var id: String
    var images: [String]
    var isFavorites: Bool
    var price: Int
    var rating: Double
    var sd: String
    var ssd: String
    var title: String
    
    init(json: JSON) {
        cpu = json["CPU"].stringValue
        camera = json["camera"].stringValue
        capacity = json["capacity"].arrayValue.map{ $0.stringValue}
        color = json["color"].arrayValue.map{ $0.stringValue}
        id = json["id"].stringValue
        images = json["images"].arrayValue.map{ $0.stringValue}
        isFavorites = json["isFavorites"].boolValue
        price = json["price"].intValue
        rating = json["rating"].doubleValue
        sd = json["sd"].stringValue
        ssd = json["ssd"].stringValue
        title = json["title"].stringValue
    }
    
    
}




