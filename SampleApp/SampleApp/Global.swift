//
//  Global.swift
//  Grab
//
//  Created by Noopur Virmani on 20/01/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

import Foundation


class Global {
    
   
    
    class func isValidEmail(string: String?) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
    
       
    
    
}
