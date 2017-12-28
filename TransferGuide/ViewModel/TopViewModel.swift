//
//  TopViewModel.swift
//  TransferGuide
//
//  Created by sillva on 2017/12/29.
//  Copyright © 2017年 sillva. All rights reserved.
//

import PromiseKit

struct TopViewModel {
    func searchRequest() -> Promise<String?> {
        let condition = Condition()
        return SearchAPI.request(condition: condition).then { (result: SearchAPIResponse) -> String? in
            return result.resourceURI
        }
    }
}
