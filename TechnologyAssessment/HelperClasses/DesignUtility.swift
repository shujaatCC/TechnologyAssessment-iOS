//
//  DesignUtility.swift


import UIKit

public class DesignUtility: NSObject {
    
    @nonobjc static let deviceRatio:CGFloat = UIScreen.main.bounds.height / 736.0;
    @nonobjc static let deviceRatioWN:CGFloat = (UIScreen.main.bounds.height - 64.0) / (736.0 - 64.0); // Ratio with Navigation
    
    /// Bool flag for device type.
    @nonobjc public static let isIPad:Bool = UIDevice.current.userInterfaceIdiom == .pad;
    
    
    // addition by waqas to set layout on iPhone X (Dimensions: 1125px x 2436px (375pt x 812pt @3x).)
    @nonobjc static let deviceRatioIphone:CGFloat = UIScreen.main.bounds.width / 375
        
       // (UIScreen.main.bounds.height > 736.0 ? 667.0 : UIScreen.main.bounds.height ) / 736.0;
    
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

