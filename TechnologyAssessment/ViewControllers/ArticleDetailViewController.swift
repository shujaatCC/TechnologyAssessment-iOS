//
//  ArticleDetailViewController.swift
//  TechnologyAssessment
//
//  Created by Shujaat Ali Khan on 14/04/2020.
//  Copyright © 2020 Shujaat Ali Khan. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
     // MARK: - Outlets
    @IBOutlet weak var imageViewArticle: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPublishedDate: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    // MARK: - Variables
     var articleData:ArticleViewModel?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Article Detail"
        setupUI()
    }
    
    private func setupUI(){
        if let data = articleData {
            imageViewArticle.setImageFromUrl(urlStr: data.imagesHeader, placeholder: "placeholder")
            lblTitle.text = data.title
            lblAuthorName.text = data.authorName
            lblAuthorName.isHidden = data.authorName == "" ? true:false
            lblPublishedDate.text = data.publishedDate
            lblDescription.text = data.description
        }
    }

}
