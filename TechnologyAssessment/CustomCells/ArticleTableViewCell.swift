//
//  ArticleTableViewCell.swift
//  TechnologyAssessment
//
//  Created by Shujaat Ali Khan on 14/04/2020.
//  Copyright © 2020 Shujaat Ali Khan. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

     // MARK: - Outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblPublishedDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView.layer.cornerRadius = imgView.frame.height/2
        imgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ data: ArticleViewModel) {
        imgView.setImageFromUrl(urlStr: data.imagesThumbnail, placeholder: "")
        lblTitle.text = data.title
        lblAuthorName.text = data.authorName
        lblPublishedDate.text = data.publishedDate
        
    }
}
