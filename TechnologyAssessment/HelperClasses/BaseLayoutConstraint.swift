//
//  BaseLayoutConstraint.swift


import UIKit

open class BaseLayoutConstraint: NSLayoutConstraint {
    
    override open func awakeFromNib() {
        
        super.awakeFromNib();

        self.constant = ceil(DesignUtility.getValueFromRatio(constant))
        
    }
}










