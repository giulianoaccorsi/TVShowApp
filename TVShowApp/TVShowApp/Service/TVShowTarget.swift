//
//  TVShowTarget.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import Foundation
import Moya

enum TVShowTarget {
    case loadTVShow
    case fetchMore(page: String)
}

extension TVShowTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Localization.TVShowTarget.Constant.baseURL) else {
            fatalError(Localization.TVShowTarget.fatalError)
        }
        return url
    }
    var parameters: [String: String] {
        switch self {
        case .loadTVShow:
            return [Localization.TVShowTarget.Dictionary.apikey: Localization.TVShowTarget.Constant.apiKey]
        case .fetchMore(page: let page):
            return [
                Localization.TVShowTarget.Dictionary.apikey: Localization.TVShowTarget.Constant.apiKey,
                    Localization.TVShowTarget.Dictionary.page: page
            ]
        }
    }
    var validationType: ValidationType {
        return .successCodes
    }
    var path: String {
        return Localization.TVShowTarget.path
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
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
