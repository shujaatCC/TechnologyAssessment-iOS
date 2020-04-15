//
//  ArticleViewModel.swift
//  TechnologyAssessment
//
//  Created by Shujaat Ali Khan on 15/04/2020.
//  Copyright © 2020 Shujaat Ali Khan. All rights reserved.
//

import Foundation
import CoreLocation


class ArticleViewModel {
    
    private let articleData: ArticleResult
    
    init(data:ArticleResult) {
        self.articleData = data
    }
    
    var title: String {
        return articleData.title ?? ""
    }
    var authorName: String {
        return articleData.byline ?? ""
    }
    var description: String {
        return articleData.abstractField ?? ""
    }
    var publishedDate: String {
        return articleData.publishedDate == "" ? "N/A":(articleData.publishedDate ?? "")
    }
    var imagesThumbnail: String {
        return articleData.media?.first?.mediametadata?.first?.url ?? ""
    }
    var imagesHeader: String {
        return articleData.media?.first?.mediametadata?[2].url ?? ""
    }
    
}

