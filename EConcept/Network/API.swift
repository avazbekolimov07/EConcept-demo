//
//  API.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import Foundation



class API {

    static let base_url = "https://run.mocky.io"
    
    struct EndPoints {
        static let categoryEndpoint = API.base_url + "/v3/654bd15e-b121-49ba-a588-960956b15175"
        static let productEndpoint = API.base_url + "/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        static let myCartEndpoint = API.base_url + "/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    }
    
//    GET - https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175
    class func getCategory(completion: @escaping(CategoryDM)->Void) {
        
        Net.simpleRequest(url: EndPoints.categoryEndpoint, method: .get, withLoader: true) { data, statusCode  in
            
            if statusCode == 200 {
                let dt = CategoryDM(json: data)
                completion(dt)
            } else {
                Alert.showAlert(state: .error, message: "ERROR ge Category details")
            }
        }
    }
    
//    GET - https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5
    class func getProduct(completion: @escaping(ProductModel)->Void) {
        
        Net.simpleRequest(url: EndPoints.productEndpoint, method: .get, withLoader: true) { data, status in
            switch status {
            case 200:
                let dt = ProductModel(json: data)
                completion(dt)
            default:
                Alert.showAlert(state: .error, message: "ERROR get Product Details")
            }
        }
    }
    
//    GET - https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149
    class func getMyCart(completion: @escaping(MyCartModel)->Void) {
        
        Net.simpleRequest(url: EndPoints.myCartEndpoint, method: .get, withLoader: true) { data, status in
            switch status {
            case 200:
                let dt = MyCartModel(json: data)
                completion(dt)
            default:
                Alert.showAlert(state: .error, message: "ERROR get MyCart Details")
            }
        }
    }

    
}
