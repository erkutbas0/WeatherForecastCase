//
//  ApiInterceptor.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//


import Foundation
import Alamofire

/// Description: Interceptor layer is responsible to combine adapter and retrier modules
class ApiInterceptor: Interceptor {

    override init(adapter: RequestAdapter, retrier: RequestRetrier) {
        super.init(adapter: adapter, retrier: retrier)
    }

}
