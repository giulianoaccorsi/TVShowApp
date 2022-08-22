// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localization {
  internal enum Generic {
    /// Localizable.strings
    ///   TVShowApp
    /// 
    ///   Created by Giuliano Accorsi on 22/08/22.
    internal static let defaultConfiguration = Localization.tr("Localizable", "Generic.DefaultConfiguration", fallback: "Default Configuration")
    /// init(coder:) has not been implemented
    internal static let fatalErrorNSCoder = Localization.tr("Localizable", "Generic.FatalErrorNSCoder", fallback: "init(coder:) has not been implemented")
  }
  internal enum ResultModel {
    /// total_pages
    internal static let totalPages = Localization.tr("Localizable", "ResultModel.totalPages", fallback: "total_pages")
    /// total_results
    internal static let totalResults = Localization.tr("Localizable", "ResultModel.totalResults", fallback: "total_results")
  }
  internal enum TVShow {
    /// N/A
    internal static let notFound = Localization.tr("Localizable", "TVShow.NotFound", fallback: "N/A")
    internal enum CodingKeys {
      /// backdrop_path
      internal static let backdropPath = Localization.tr("Localizable", "TVShow.CodingKeys.backdropPath", fallback: "backdrop_path")
      /// first_air_date
      internal static let firstAirDate = Localization.tr("Localizable", "TVShow.CodingKeys.firstAirDate", fallback: "first_air_date")
      /// poster_path
      internal static let posterPath = Localization.tr("Localizable", "TVShow.CodingKeys.posterPath", fallback: "poster_path")
      /// vote_average
      internal static let voteAverage = Localization.tr("Localizable", "TVShow.CodingKeys.voteAverage", fallback: "vote_average")
    }
    internal enum Url {
      /// https://image.tmdb.org/t/p/w500/
      internal static let image = Localization.tr("Localizable", "TVShow.URL.image", fallback: "https://image.tmdb.org/t/p/w500/")
    }
  }
  internal enum TVShowTarget {
    /// Failed to load baseURL
    internal static let fatalError = Localization.tr("Localizable", "TVShowTarget.FatalError", fallback: "Failed to load baseURL")
    /// tv/top_rated
    internal static let path = Localization.tr("Localizable", "TVShowTarget.path", fallback: "tv/top_rated")
    internal enum Constant {
      /// e67ebe33d00c9960fe5c35b3e75a1b22
      internal static let apiKey = Localization.tr("Localizable", "TVShowTarget.Constant.apiKey", fallback: "e67ebe33d00c9960fe5c35b3e75a1b22")
      /// https://api.themoviedb.org/3/
      internal static let baseURL = Localization.tr("Localizable", "TVShowTarget.Constant.baseURL", fallback: "https://api.themoviedb.org/3/")
    }
    internal enum Dictionary {
      /// api_key
      internal static let apikey = Localization.tr("Localizable", "TVShowTarget.Dictionary.apikey", fallback: "api_key")
      /// page
      internal static let page = Localization.tr("Localizable", "TVShowTarget.Dictionary.page", fallback: "page")
    }
  }
  internal enum TVShowViewController {
    /// Popular • Serie
    internal static let titleView = Localization.tr("Localizable", "TVShowViewController.TitleView", fallback: "Popular • Serie")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localization {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
