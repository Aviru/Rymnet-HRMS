//
//  LoginWebService.swift
//  Rymnet HRMS
//
//  Created by Aviru bhattacharjee on 26/09/17.
//  Copyright © 2017 com.aviru. All rights reserved.
//

import UIKit

class LoginWebService: WebServiceController {
    
    
    static let Service = LoginWebService()
    
    func callLoginWebService(dictParams: Dictionary<String, String> , _ completion: @escaping CompletionHandler) {
        
        requestPostUrl(LOGIN_REF, params: dictParams) { (isError, strMsg) in
            
            if isError {
                
                completion(true, strMsg)
            }
            else {
                completion(false, strMsg)
            }
        }
    }
    
    
}
