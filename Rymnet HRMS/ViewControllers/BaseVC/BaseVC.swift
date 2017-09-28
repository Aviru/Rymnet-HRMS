//
//  BaseVC.swift
//  Rymnet HRMS
//
//  Created by Aviru bhattacharjee on 21/09/17.
//  Copyright © 2017 com.aviru. All rights reserved.
//

import UIKit
 let appDel = UIApplication.shared.delegate as! AppDelegate

// MARK: - Extension

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}



class BaseVC: UIViewController {
    
    lazy var activityIndicator : CustomActivityIndicatorView = {
        let image : UIImage = #imageLiteral(resourceName: "loading_icon128x128") //UIImage(named: "loading_icon128x128.png")!
        return CustomActivityIndicatorView(image: image)
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addLoadingIndicator()
    }
    
    func addLoadingIndicator () {
        self.view.addSubview(activityIndicator)
        activityIndicator.center = self.view.center
    }
    
    //MARK:- Validate Email
    
    func validateEmail(_ tempMail : String) -> Bool {
        
        let stricterFilterString : String = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        // let laxString : String = ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let emailRegex = stricterFilterString
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailTest.evaluate(with:tempMail)
        
    }
    //MARK:-  Show alert
    
    func showAlertMessage(titl : String, msg : String, displayTwoButtons : Bool) {
        
        let actionSheetController: UIAlertController = UIAlertController(title: titl, message: msg, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(okAction)
        
        if displayTwoButtons {
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                //Just dismiss the action sheet
            }
            
            actionSheetController.addAction(cancelAction)
        }
        
        self.present(actionSheetController, animated: true, completion: nil)
        
    }

     // MARK: -

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
