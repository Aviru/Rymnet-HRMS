//
//  HRMSViewVC.swift
//  Rymnet HRMS
//
//  Created by Aviru bhattacharjee on 28/09/17.
//  Copyright © 2017 com.aviru. All rights reserved.
//

import UIKit

class HRMSViewVC: BaseVC,UIWebViewDelegate {
    
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let strURL = "\(loginInfoModelObj.strRedirectUrl!)\(loginInfoModelObj.strAuthToken!)"
        
        print("RymnetHRMS URL:\(strURL)")
        
        webView.loadRequest(URLRequest(url: URL(string: strURL)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        showAlertMessage(titl: "Error", msg: error.localizedDescription, displayTwoButtons: false)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
