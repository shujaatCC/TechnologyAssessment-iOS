//
//  AFRequestParam.swift


import Foundation
import UIKit
import Alamofire

//request param for call
public struct AFParam {
    var endpoint: String = ""
    var params: [String : Any]?
    var headers: [String : String]?
    var method: HTTPMethod
    var images: [UIImage]?
    var parameterEncoding: ParameterEncoding
    
    public init(endpoint:String, params: [String : Any], headers: [String : String], method: HTTPMethod, parameterEncoding: ParameterEncoding, images: [UIImage]) {
        self.endpoint = endpoint
        self.params = params
        self.headers = headers
        self.method = method
        self.images = images
        self.parameterEncoding = parameterEncoding
    }
}

