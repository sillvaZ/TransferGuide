//
//  SearchAPI.swift
//  TransferGuide
//
//  Created by sillva on 2017/12/29.
//  Copyright © 2017年 sillva. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import PromiseKit

struct SearchAPI {
    static func request(condition: Condition) -> Promise<SearchAPIResponse> {
        return Promise(.pending) { seal in
            let request = SearchAPIRequest(condition: condition)
            Alamofire
                .request(request.url)
                .validate(contentType: ["application/json"])
                .responseObject { (response: DataResponse<SearchAPIResponse>) in
                    switch response.result {
                    case .success(let value):
                        seal.fulfill(value)
                    case .failure(let error):
                        seal.reject(error)
                    }
            }
        }
    }
}

struct SearchAPIRequest {
    let url = URL(string: "https://")!
    
    init(condition: Condition) {
    }
}

import ObjectMapper

final class SearchAPIResponse: Mappable {
    var apiVersion: String?
    var engineVersion: String?
    var resourceURI: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        apiVersion <- map["ResultSet.apiVersion"]
        engineVersion <- map["ResultSet.engineVersion"]
        resourceURI <- map["ResultSet.ResourceURI"]
    }
}
