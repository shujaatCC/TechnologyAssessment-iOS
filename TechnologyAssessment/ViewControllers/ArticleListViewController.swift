//
//  ArticleListViewController.swift
//  TechnologyAssessment
//
//  Created by Shujaat Ali Khan on 14/04/2020.
//  Copyright © 2020 Shujaat Ali Khan. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableViewArticles: UITableView!
    
    
    // MARK: - Variables
    var articlesData:[ArticleViewModel] = []
    private var period = Period.sevenDays
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Popular Articles"
        setUpTableView()
        getPopulerArticles(period)
    }
    
    // MARK: - Private Methods
    private func setUpTableView() {
        tableViewArticles.registerCell(ArticleTableViewCell.self)
        tableViewArticles.registerCell(ArticleTableViewCell.self)
        tableViewArticles.rowHeight = UITableView.automaticDimension
        tableViewArticles.estimatedRowHeight = 200
        tableViewArticles.delegate = self
        tableViewArticles.dataSource = self
    }
    
    //MARK:- APIS
    private func getPopulerArticles(_ period:Int) {
        if !Internet.checkInternet() {
            return
        }
        
        ArticleServiceManager().getPopulerArticles(period: period) { [unowned self] (data) in
            self.articlesData = data.results?.map({ (item) -> ArticleViewModel in
                return ArticleViewModel(data: item)
            }) ?? []
            self.tableViewArticles.reloadData()
        }
        
    }
}

//MARK:- TableView DataSource & Delegate
extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier(), for: indexPath) as! ArticleTableViewCell
        
        cell.setData(articlesData[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Router().gotoArticleDetail(vc: self, data: articlesData[indexPath.row])
    }
}
