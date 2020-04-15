//
//  ArticleServiceManager.swift
//  TechnologyAssessment
//
//  Created by Shujaat Ali Khan on 14/04/2020.
//  Copyright © 2020 Shujaat Ali Khan. All rights reserved.
//

import Foundation
import Alamofire

class ArticleServiceManager {
    
    func apiGeneric<T : Decodable> (_ param: AFParam,isLoader:Bool , modelType : T.Type , completion: @escaping (T) -> Void){

        //request
        AFNetwork.shared.apiRequest(param, isSpinnerNeeded: isLoader, success: { (response) in
            
            guard let data = response else { return }
            
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(modelType.self, from: data)
                
                completion(result)
                
            }catch let error{
                print("Error: ", error)
            }
            
        }) { (error) in
            
        }
    }
    
    func getPopulerArticles(period:Int,completion: @escaping (ArticleBase) -> Void){
        let endpoint = String(format:Route.populerArticles,period)
        let param = AFParam(endpoint: endpoint, params: ["api-key":Route.ApiKey], headers: [:], method: .get, parameterEncoding: URLEncoding.default, images: [])
        
        self.apiGeneric(param, isLoader: true, modelType:ArticleBase.self ) { (res) in

            if res.status == ServiceStatus.successCode {
                completion(res)
            }else{
                Alert.showMsg(title: "Alert", msg: "Something went wrong", btnActionTitle: "Ok")
            }

        }
    }
    
}




