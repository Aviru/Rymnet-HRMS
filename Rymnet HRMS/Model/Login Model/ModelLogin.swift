//
//  ModelLogin.swift
//  Rymnet HRMS
//
//  Created by Aviru bhattacharjee on 24/09/17.
//  Copyright © 2017 com.aviru. All rights reserved.
//

import UIKit

class ModelLogin: NSObject,NSCoding {
    
    var strAuthToken: String?
    var strRedirectUrl: String?
       
    // MARK: NSCoding
    
    init(authToken : String, redirectUrl: String) {
        self.strAuthToken = authToken
        self.strRedirectUrl = redirectUrl
      
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let authToken = decoder.decodeObject(forKey: "authtoken") as? String,let redirectUrl = decoder.decodeObject(forKey: "redirectURL") as? String
            else {
                return nil
        }
        
        self.init(authToken : authToken, redirectUrl: redirectUrl)
    }
    
    
    func encode(with aCoder: NSCoder)  {
        aCoder.encode(self.strAuthToken, forKey: "authtoken")
        aCoder.encode(self.strRedirectUrl, forKey: "redirectURL")
           }
    
    init(infoDic: NSDictionary) {
        
        if let Token = infoDic["authtoken"] as? String
        {
            self.strAuthToken = Token
        }
        else
        {
            self.strAuthToken = ""
        }
        
        if let Url = infoDic["redirectURL"] as? String
        {
            self.strRedirectUrl = Url
        }
        else
        {
            self.strRedirectUrl = ""
        }
        
    }


}
