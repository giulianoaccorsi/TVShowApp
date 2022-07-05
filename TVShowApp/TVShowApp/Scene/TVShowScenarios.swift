//
//  TVShowScenarios.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

enum TVShowScenarios {
    
    enum Fetch {
        struct Request {}
        struct Response {
            var showsList: [TVShow]
        }
        struct ViewModel {
            var showsList: [TVShow]
        }
    }
    
    enum Change {
        struct Request {
            var tvShow: TVShow
        }
        struct Response {
            var tvShow: TVShow
        }
        struct ViewModel {
            var year: String
            var voteAverage: String
            var backgroundImage: URL
            var name: String
        }
    }
    
    enum Error {
        struct Request {}
        struct Response {
            var error: String
        }
        struct ViewModel {
        }
    }
}
