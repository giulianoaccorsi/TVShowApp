//
//  TVShowModel.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import Foundation

// MARK: - TVShow
struct ResultAPI: Codable {
    let page: Int?
    let results: [TVShow]?
    let totalPages, totalResults: Int?
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct TVShow: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?
    let voteAverage: Double?
    let backdropPath: String?
    let firstAirDate: String?
    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
    }
    var posterURL: URL? {
        if let urlString = posterPath,
        let url = URL(string: "\(Localization.TVShow.Url.image)\(urlString)") {
            return url
        }
        return nil
    }
    var backdropURL: URL? {
        if let urlString = backdropPath,
        let url = URL(string: "\(Localization.TVShow.Url.image)\(urlString)") {
            return url
        }
        return nil
    }
    var voteAverageString: String {
        guard let voteAverage = self.voteAverage else {
            return Localization.TVShow.notFound
        }
        return "\(voteAverage)"
    }
    var date: String {
        if let firstAirDate = self.firstAirDate {
            return String(firstAirDate.prefix(4))
        }
        return Localization.TVShow.notFound
    }
}
