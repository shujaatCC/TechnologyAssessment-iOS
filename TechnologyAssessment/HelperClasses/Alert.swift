//
//  Alert.swift


import UIKit

public class Alert {
    
    private static var parentWindow:UIViewController?;
    
    private init(){
        
    }
    
    public static func showMsg(title : String = "Notification", msg : String , btnActionTitle : String? = "Okay" ) -> Void{
        
        self.parentWindow = nil;
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: btnActionTitle, style: .default) { (action) in
            
            
        }
        alertController .addAction(alertAction)
        
        Alert.showOnWindow(alertController)
    }
    
    private static func showOnWindow(_ alert : UIAlertController) {
        
        if parentWindow != nil {
            parentWindow?.present(alert, animated: true, completion: nil)
        }
        else {
            
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.present(alert, animated: true, completion: nil)
                // topController should now be your topmost view controller
            }
        }
        
        
    }
}


