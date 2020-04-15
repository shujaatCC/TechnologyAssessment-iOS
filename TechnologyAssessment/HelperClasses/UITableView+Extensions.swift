//
//  UITableView+Extensions.swift


import UIKit

extension UITableViewCell{
    static func identifier() -> String{
        return "\(self)"
    }
    
    
    static func nib() -> UINib{
        return UINib.init(nibName: "\(self)", bundle: nil)
    }
}


extension UITableView{
    
    func registerCell<T: UITableViewCell>(_: T.Type) {
        register(T.nib(), forCellReuseIdentifier: T.identifier())
    }
}
