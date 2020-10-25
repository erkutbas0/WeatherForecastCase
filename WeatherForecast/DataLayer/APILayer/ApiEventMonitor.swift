//
//  ApiEventMonitor.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//


import Foundation
import Alamofire

/// Description: It's used for tracking events going through network layer
class ApiEventMonitor: EventMonitor {

    func request(_ request: Request, didCreateURLRequest urlRequest: URLRequest) {

    }

    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {

    }

}
