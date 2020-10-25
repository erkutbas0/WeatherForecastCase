//
//  HttpClientInterface.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//


import Foundation
import RxSwift
import Alamofire

protocol HttpClientInterface {
    func executeRequest<R: CodableDataProtocol>(urlRequestConvertible: URLRequestConvertible) -> Single<R>
    func responseParser<R: CodableDataProtocol>(alamofireResponseData: AFDataResponse<Data?>, single: Single<R>.SingleObserver)
}
