//
//  LoginTVCell.swift
//  AppsPicket
//
//  Created by Noopur Virmani on 14/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

import Foundation
import UIKit

@objc protocol  LoginTVCellDelegate{
    @objc optional func segmentcontrolMethodClicked(segmentControl: UISegmentedControl)
    @objc optional func submitBtnClickedDelegateMethod()
}

class LoginTVCell: BaseTVCell{
    
    var delegate: LoginTVCellDelegate?
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var submitBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        if(segmentControl != nil){
            segmentControl.tintColor = Color.themeDarkColor
            
            segmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white , NSFontAttributeName: UIFont.boldSystemFont(ofSize: Color.font_size)], for: UIControlState.selected)
            segmentControl.setTitleTextAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: Color.font_size)], for: UIControlState.normal)
            //segmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: UIControlState.normal)
           /* let frame = segmentControl.frame
            let rect = CGRect(origin: CGPoint(x: frame.origin.x,y :frame.origin.y), size: CGSize(width: frame.size.width, height: 40))

            segmentControl.frame = rect*/

        }
        
        if(submitBtn != nil){
            submitBtn.backgroundColor = Color.themeDarkColor
            submitBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: Color.font_size)
        }
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    @IBAction func submitBtnClicked(_ sender: UIButton) {
        delegate?.submitBtnClickedDelegateMethod!()
    }
    
    
    @IBAction func segmentControlValueChanged(_ sender: AnyObject) {
        let segment = sender as! UISegmentedControl
        delegate?.segmentcontrolMethodClicked!(segmentControl: segment)
    }
    
}
