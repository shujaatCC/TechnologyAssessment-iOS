//
//  Router.swift


import UIKit

class Router  {
    // push to article deatil view controller
    func gotoArticleDetail(vc:UIViewController, data:ArticleViewModel? = nil){
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.main.rawValue, bundle: nil)
        
        let articleDetailVC = mainStoryboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
        articleDetailVC.articleData = data
        vc.navigationController?.pushViewController(articleDetailVC, animated: true)
    }
    

}

