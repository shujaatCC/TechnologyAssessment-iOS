//
//  TechnologyAssessmentTests.swift
//  TechnologyAssessmentTests
//
//  Created by Shujaat Ali Khan on 14/04/2020.
//  Copyright © 2020 Shujaat Ali Khan. All rights reserved.
//

import XCTest
@testable import TechnologyAssessment

class TechnologyAssessmentTests: XCTestCase {
    var artivcleListVC : ArticleListViewController!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: Storyboards.main.rawValue, bundle: Bundle.main)
        guard let vc : ArticleListViewController = storyboard.instantiateViewController(withIdentifier: "ArticleListViewController") as? ArticleListViewController else{
            return XCTFail("Could not instantiate SCreatedListViewController")
        }
        artivcleListVC = vc
        UIApplication.shared.keyWindow?.rootViewController = UINavigationController.init(rootViewController: vc)
        _ = artivcleListVC.view // To call viewDidLoad
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         artivcleListVC = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testControllerHasTableView() {
        
        XCTAssertNotNil(artivcleListVC.tableViewArticles,"Controller should have a tableview")
    }
    
    func testTableViewDelegateSetUpCorrectly() {
        
        XCTAssertTrue(artivcleListVC.tableViewArticles.delegate is ArticleListViewController , "ArticleListViewController does not conform to UITableView delegate protocol")
        
    }

    func testTableViewDataSourceSetUpCorrectly() {
        
        XCTAssertTrue(artivcleListVC.tableViewArticles.dataSource is ArticleListViewController , "ArticleListViewController does not conform to UITableView datasource protocol")
        
    }
    
    func testNavigateToDetailScreenAfterRowSelection()  {
        let expectation = self.expectation(description: "should navigate to ArticleDetailViewController")
        
        // this test verifies correct functionality of didSelectRow method
        
        ArticleServiceManager().getPopulerArticles(period: Period.sevenDays) { [unowned self] (data) in
            self.artivcleListVC.articlesData = data.results?.map({ (item) -> ArticleViewModel in
                return ArticleViewModel(data: item)
            }) ?? []
            
            Router().gotoArticleDetail(vc: self.artivcleListVC, data: self.artivcleListVC.articlesData[0])
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                XCTAssertNotNil(self.artivcleListVC.navigationController?.topViewController as? ArticleDetailViewController)
                expectation.fulfill()
            })
            
        }
        
        waitForExpectations(timeout: 20, handler: nil)
        
        
    }
    
    func testServiceCall()  {
          
        let expectation = self.expectation(description: "should recieve data")
        
        ArticleServiceManager().getPopulerArticles(period: Period.sevenDays) { (data) in
            if data.status == ServiceStatus.successCode {
                 expectation.fulfill()
            }else{
                XCTFail("service failed")
                print("service failed")
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
      }
}
