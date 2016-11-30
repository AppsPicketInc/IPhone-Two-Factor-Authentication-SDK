//
//  TextFieldTVCell.swift
//  AppsPicket
//
//  Created by Noopur Virmani on 14/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

import Foundation
import UIKit

class TextFieldTVCell: BaseTVCell{
    
    
    @IBOutlet var textField: UITextField!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        if(textField != nil){
            textField.tintColor = UIColor.black
            textField.font = UIFont.systemFont(ofSize: Color.font_size)
        }
        
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    
}
