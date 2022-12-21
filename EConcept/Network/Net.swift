//
//  Net.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import Alamofire
import SwiftyJSON


class Net  {
    
    class func simpleRequest(url: String, method: HTTPMethod, withLoader: Bool, completion: @escaping(JSON, Int)->Void) {
        
        Loader.start()
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { (response) in
            
            Loader.stop()
            print("DATA REQUEST:", response.request ?? "")
            switch response.result {
                
            case .success:
                let json = JSON(response.data!)
                print("⚠️ RESPONSE DATA:", json)
                completion(json, response.response!.statusCode)
            case .failure(let eror):
                print("❌ Error RESPONSE DATA", eror)
                Alert.showAlert(state: .error, message: "ERROR DATA", duration: 2, serInteration: true)
            }
        }
    }
    
    class func requestJSONEncoding(url: String, method: HTTPMethod, param: [String:Any]?, header: HTTPHeaders?, withLoader: Bool, completion: @escaping(JSON, Int?)->Void ) {
        
        if Reachability.isConnectedToNetwork() {
            if withLoader {
                Loader.start()
            }
            
            AF.request(url, method: method, parameters: param, encoding: JSONEncoding.default, headers: header).response { (response) in
                
                Loader.stop()
                print("DATA REQUEST:", response.request ?? "")
                print("PARAMS DATA:", param ?? "")
                switch response.result {
                case .success:
                    let json = JSON(response.data!)
                    print("⚠️ RESPONSE DATA:", json)
                    completion(json, response.response?.statusCode)
                case .failure(let eror):
                    print("❌ Error RESPONSE DATA", eror)
                    Alert.showAlert(state: .error, message: "ERROR DATA")
                }
            }
        }
    }
    
    
    
        

    
}

