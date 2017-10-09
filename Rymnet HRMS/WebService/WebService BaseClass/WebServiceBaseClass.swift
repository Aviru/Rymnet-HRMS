//
//  WebServiceBaseClass.swift
//  Rymnet HRMS
//
//  Created by Aviru bhattacharjee on 24/09/17.
//  Copyright © 2017 com.aviru. All rights reserved.
//

import Foundation

import Alamofire

typealias CompletionHandler = (_ isError: Bool, _ errorMsg: String?) -> Void

class WebServiceController {
    
    static let webService = WebServiceController()
    
    let BASE_URL = "http://cloud.rymnet.com/rymservice.asmx/"
    
    
    let LOGIN_URL = "openauthJSON"
    
    /** The Login reference */
    var LOGIN_REF: String {
        return "\( BASE_URL)\(LOGIN_URL)"
    }

    
    
    func requestPostUrl(_ strURL: String, params: Dictionary<String, String> , _ completion: @escaping CompletionHandler) {
        
        //@escaping (_ isError: Bool, _ errorMsg: String?) -> Void
        /*
         Alamofire.request(strURL, method: .post, parameters: params,encoding: JSONEncoding.default, headers: nil).responseJSON {
         response in
         
         print(response.request!)
         
         switch response.result {
         case .success:
         print(response)
         break
         case .failure(let error):
         
         print(error)
         }
         }
         */
        
        Alamofire.request(
            URL(string: strURL)!,
            method: .post,
            parameters: params)
            .validate()
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    print("Error while fetching remote data: \(String(describing: response.result.error))")
                    completion(true,response.result.error!.localizedDescription)
                    return
                }
                
                print("original URL request: \(response.request!)")  // original URL request
                print("URL response: \(response.response!)") // URL response
               
               // print("result of response serialization: \(String(describing: response.result.value))")   // result of response serialization
                
                if let string = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) {
                    print("JSON Response: \(string)")  // server data
                }
                
                guard let dictLogin = response.result.value as? NSDictionary else {
                    print("Malformed data received from Webservice")
                    completion(true,"Malformed data received from Webservice")
                    return
                }
                
                print("Login Dictionary: \(dictLogin)")
                
                loginInfoModelObj = ModelLogin.init(infoDic: dictLogin)
                let data = NSKeyedArchiver.archivedData(withRootObject: loginInfoModelObj)
                
                
                if GlobalUserDefaults.saveObject(obj: data as AnyObject, key: "loginInfo"){
                    
                    print("saved to UserDefaults")
                }
                else{
                    
                    print("unable to save UserDefaults")
                }
                
                completion(false,"")
                
        }
        
    }
    
}


