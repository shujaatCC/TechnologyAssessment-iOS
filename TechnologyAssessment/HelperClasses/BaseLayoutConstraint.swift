//
//  BaseLayoutConstraint.swift


import UIKit

open class BaseLayoutConstraint: NSLayoutConstraint {
    
    override open func awakeFromNib() {
        
        super.awakeFromNib();
      //  self.constant = DesignUtility.convertToRatio(constant, sizedForIPad: false, sizedForNavi:false)
        
        self.constant = ceil(DesignUtility.getValueFromRatio(constant))
        
    }
}










