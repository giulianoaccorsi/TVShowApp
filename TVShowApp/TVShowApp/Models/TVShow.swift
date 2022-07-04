//
//  TVShowModel.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import Foundation

// MARK: - TVShow
struct Result: Codable {
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
    
    var posterURL: URL {
        guard let urlString = posterPath else {
            return URL(string: "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg")!
        }
        return URL(string: "https://image.tmdb.org/t/p/w500/\(urlString)")!
    }
    
    var backdropURL: URL {
        guard let urlString = backdropPath else {
            return URL(string: "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg")!
        }
        return URL(string: "https://image.tmdb.org/t/p/w500/\(urlString)")!
    }
    
    var voteAverageString: String {
        guard let voteAverage = self.voteAverage else {
            return "N/A"
        }
        return "\(voteAverage)"
    }
    
    var date: String {
        if let firstAirDate = self.firstAirDate {
            return String(firstAirDate.prefix(4))
        }
        
        return "N/A"
    }
}

