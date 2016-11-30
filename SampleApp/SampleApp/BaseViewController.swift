//
//  BaseViewController.swift
//  AppsPicket
//
//  Created by Noopur Virmani on 14/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    
    var HUD: MBProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DismissKeyboard()
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    //MARK: View switch
    
    func mainViewControllerCalled(){
        let controllerObejct = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as?
        MainViewController
        self.navigationController?.pushViewController(controllerObejct!, animated: true)
    }
    
    
    
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.view.endEditing(true)
    }
    
    
    //MARK: Loading Methods
    
    func showLoadingDialog(loadingText: String?){
        
        HUD = MBProgressHUD.showAdded(to: self.navigationController!.view, animated: true)
       // HUD?.color = Color.themeDarkColor
      //  HUD?.activityIndicatorColor = UIColor.whiteColor()
       // HUD?.labelText = loadingText
       // HUD?.labelColor = UIColor.whiteColor()
        
        // HUD?.mode = MBProgressHUDMode.CustomView
        //HUD?.customView = UIImageView(image: UIImage(named: "Loading_icon.gif"))
        
        // TAOverlay.showOverlayWithLabel(loadingText ?? NSLocalizedString("please_wait", comment: ""), options:[.OverlaySizeRoundedRect, .OverlayTypeActivitySquare, .OpaqueBackground, .OverlayShadow])
        
        //,image: UIImage(named: "load_logo.png"),
    }
    
    func hideLoadingDialog(){
        if(HUD != nil){
            HUD?.hide(animated: true)
        }
        
        //TAOverlay.hideOverlay()
    }
 
    
     //MARK: Tap Gesture
    
    func addTapGestureToView(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.DismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }



}
