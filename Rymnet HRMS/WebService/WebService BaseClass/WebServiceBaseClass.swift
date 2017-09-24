//
//  WebServiceBaseClass.swift
//  Rymnet HRMS
//
//  Created by Aviru bhattacharjee on 24/09/17.
//  Copyright © 2017 com.aviru. All rights reserved.
//

import Foundation

import Alamofire

class WebServiceController {
    
    static let webService = WebServiceController()
    
    let BASE_URL = "http://cloud.rymnet.com/rymservice.asmx/"
    
    let LOGIN_URL = "openauthJSON"
    
    
    /** The Login reference */
    var LOGIN_REF: String {
        return "\(BASE_URL) \(LOGIN_URL)"
    }
    
}


func requestPostUrl(_ strURL: String, params: Dictionary<String, String> , _ completion: @escaping (Any?,_ isError: Bool, _ error: NSError?) -> Void) {
    
    Alamofire.request(
        URL(string: strURL)!,
        method: .post,
        parameters: params)
        .validate()
        .responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                completion(nil,true,response.result.error! as NSError)
                return
            }
            
            guard let value = response.result.value as? [String: Any],
                let rows = value["rows"] as? [[String: Any]] else {
                    print("Malformed data received from fetchAllRooms service")
                    completion(nil)
                    return
            }
            
            let rooms = rows.flatMap({ (roomDict) -> RemoteRoom? in
                return RemoteRoom(jsonData: roomDict)
            })
            
            completion(rooms)
    }
}
