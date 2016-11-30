//
//  MainViewController.swift
//  AppsPicket
//
//  Created by Noopur Virmani on 14/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

import Foundation
import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(logoutBtn != nil){
            logoutBtn.backgroundColor = Color.themeDarkColor
            logoutBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        }
        //self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func logoutBtn_Clicked(_ sender: AnyObject) {
        let _ = navigationController?.popViewController(animated: true)
    }
 
}
