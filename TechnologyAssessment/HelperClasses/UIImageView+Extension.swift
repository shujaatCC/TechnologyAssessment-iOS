//
//  UIImageView+Extension.swift


import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageFromUrl(urlStr:String, placeholder: String){
        
        if urlStr.isEmpty{
            self.image = UIImage(named: placeholder)
            return
        }
        
        if let url = URL(string: urlStr) {
            self.kf.indicatorType = .activity
            
            self.kf.setImage(with: url,
                             placeholder: UIImage(named: placeholder),
                             options: [.transition(.fade(1))],
                             progressBlock: nil,
                             completionHandler: nil)
        }
        
    }
}
