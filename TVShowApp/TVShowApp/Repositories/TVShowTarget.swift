//
//  TVShowTarget.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import Foundation
import Moya

enum RequestConstant: String {
    case baseURL = "https://api.themoviedb.org/3/"
    case tvShowPath = "tv/top_rated"
    case headerKey1 = "Content-Type"
    case headerValue1 = "application/json"
    case apiKey = "e67ebe33d00c9960fe5c35b3e75a1b22"
}

// Each enum case is a different API request
enum TVShowTarget {
    case loadTVShow
    case fetchMore(page: String)
}

extension TVShowTarget: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: RequestConstant.baseURL.rawValue) else {fatalError()}
        return url
    }
    
    var parameters: [String: String] {
        switch self {
        case .loadTVShow:
            return ["api_key": RequestConstant.apiKey.rawValue]
        case .fetchMore(page: let page):
            return["api_key": RequestConstant.apiKey.rawValue, "page": page]
        }
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var path: String {
        return RequestConstant.tvShowPath.rawValue
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .loadTVShow:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .fetchMore(page: _):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [RequestConstant.headerKey1.rawValue: RequestConstant.headerValue1.rawValue]
    }
}
