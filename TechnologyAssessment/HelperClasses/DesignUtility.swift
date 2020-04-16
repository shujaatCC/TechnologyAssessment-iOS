//
//  DesignUtility.swift


import UIKit

public class DesignUtility: NSObject {

    /// Bool flag for device type.
    @nonobjc public static let isIPad:Bool = UIDevice.current.userInterfaceIdiom == .pad;
    
    @nonobjc static let deviceRatioIphone:CGFloat = UIScreen.main.bounds.width / 375
    
    @nonobjc static let deviceRatioIpad:CGFloat = UIScreen.main.bounds.height / 1366.0;
    
    
    public class func getValueFromRatio(_ value:CGFloat) ->CGFloat
    {
        
        if (DesignUtility.isIPad ) {
            return (value * DesignUtility.deviceRatioIpad)
        }else{
            return (value * (DesignUtility.deviceRatioIphone == 0 ? 1 : DesignUtility.deviceRatioIphone ))
        }
    }
    
}

