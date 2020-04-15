//
//  AFNetwork.swift


import UIKit
import Alamofire

//main class
public class AFNetwork: NSObject {
    
    //MARK: constant and variable
    //manager
    public var alamoFireManager: Alamofire.SessionManager!
    
    //spinner
    struct spinnerViewConfig {
        static let tag: Int = 98272
        static let color = UIColor.white
    }

    
    //shared Instance
    public static let shared: AFNetwork = {
        let instance = AFNetwork()
        return instance
    }()
    
    // MARK: - : override
    override init() {
        alamoFireManager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default
        )
        alamoFireManager.session.configuration.timeoutIntervalForRequest = 120
    }
    
}

// MARK: - Request
extension AFNetwork {
    
    //general request
    public func apiRequest(_ info: AFParam, isSpinnerNeeded: Bool, success:@escaping (Data?) -> Void, failure:@escaping (Error) -> Void) {
        
        //if spinner needed
        if isSpinnerNeeded {
            DispatchQueue.main.async {
                AFNetwork.shared.showSpinner(nil)
            }
        }
        //URLEncoding(destination: .methodDependent)
        //request
        alamoFireManager.request(Route.BaseURL + info.endpoint, method: info.method, parameters: info.params, encoding: info.parameterEncoding, headers: info.headers).responseJSON { (response) -> Void in
            
            
            //remove spinner
            if isSpinnerNeeded {
                DispatchQueue.main.async {
                    AFNetwork.shared.hideSpinner()
                }
            }
            
            //check response result case
            switch response.result {
            case .success:
                debugPrint(response)
                success(response.data)
            case .failure:
                let error : Error = response.result.error!
                debugPrint("responseError: \(error)")
                Alert.showMsg(msg: error.localizedDescription)
                failure(error)
            }
        }
    }
   
}

// MARK: - spinner methods
extension AFNetwork {
    
    //show spinner
    public func showSpinner(_ customView: UIView?) {
        
        var window = customView
        
        if (window == nil) {
            window = returnTopWindow()
        }
        if ((window?.viewWithTag(spinnerViewConfig.tag)) != nil) {
            return
        }
        
        //background view
        let backgroundView = UIView(frame: CGRect.zero)
        backgroundView.tag = spinnerViewConfig.tag
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        window?.addSubview(backgroundView)
        window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[backgroundView]|", options: [], metrics: nil, views: ["backgroundView" : backgroundView]))
        window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[backgroundView]|", options: [], metrics: nil, views: ["backgroundView" : backgroundView]))
        
        //spinner
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = spinnerViewConfig.color
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        backgroundView.addSubview(activityIndicator)
        backgroundView.addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        backgroundView.addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
    
    //hide spinner
    public func hideSpinner() {
        
        let window: UIWindow? = returnTopWindow()
        window?.viewWithTag(spinnerViewConfig.tag)?.removeFromSuperview()
    }
}

// MARK: - Helper methods
extension AFNetwork {
    
    
    //return top window
    func returnTopWindow() -> UIWindow {
        
        let windows: [UIWindow] = UIApplication.shared.windows
        
        for topWindow: UIWindow in windows {
            if topWindow.windowLevel == UIWindow.Level.normal {
                return topWindow
            }
        }
        return UIApplication.shared.keyWindow!
    }

}

class Internet {
    class var isConnected:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    class func checkInternet() -> Bool {
        if !Internet.isConnected {
            Alert.showMsg(title: "Alert!", msg: "Please Check your internet connection.", btnActionTitle: "Ok")
        }
        return Internet.isConnected
    }
}

