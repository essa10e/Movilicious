//
//  MovieStruct.swift
//  Movilicious
//
//  Created by ESSA AL on 7/29/20.
//

import Foundation

struct MovieResult: Codable {
    var popularity: Double?
    var id: Int?
    var video: Bool?
    var vote_count: Int?
    var vote_average: Double?
    var title: String?
    var release_date: String?
    var original_language: String?
    var original_title: String?
    var backdrop_path: String?
    var adult: Bool?
    var overview: String?
    var poster_path: String?
    var genre_ids: [Int]?
}

struct Movie: Codable {
    var results: [MovieResult]
}

//******************************************************
//******************************************************

struct TVResults: Codable {
    var popularity: Double?
    var id: Int?
    var vote_count: Int?
    var vote_average: Double?
    var name: String?
    var first_air_date: String?
    var original_language: String?
    var original_name: String?
    var origin_country: [String]?
    var backdrop_path: String?
    var overview: String?
    var poster_path: String?
    var genre_ids: [Int]?
}


struct TV: Codable {
    var results: [TVResults]
    
}
//******************************************************
//******************************************************


struct GenreResults: Codable {
    var id: Int?
    var name: String?
}

struct Genre: Codable {
    var genres: [GenreResults]
}

//******************************************************
//******************************************************

struct TrendingMO: Codable {
    var results: [MovieResult]
}
struct TrendingTV: Codable {
    var results: [TVResults]
}

//******************************************************
//******************************************************

let GENRES_LIST = [
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western",
]

//******************************************************
//******************************************************











/*
struct Results: Decodable {
    var popularity: Double?
    var id: Int?
    var video: Bool?
    var voteCount: Int?
    var voteAverage: Int?
    var title: String?
    var releaseDate: String?
    var originalLanguage: String?
    var originalTitle: String?
    var backdropPath: String?
    var adult: Bool?
    var overview: String?
    var posterPath: String?
    
    
}

struct Movie: Decodable {
    var page: Int?
    var totalResult: Int?
    var totalPages: Int?
    var results: [Results]?
    
    
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalResult = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    enum ResultCodingKeys: String, CodingKey {
        case popularity
        case id
        case video
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case posterPath = "poster_path"
        
    }
    
//    init(from decoder: Decoder) throws {
//        if let movieContainer = try? decoder.container(keyedBy: CodingKeys.self) {
//            page = try movieContainer.decode(Int.self, forKey: .page)
//            totalResult = try movieContainer.decode(Int.self, forKey: .totalResult)
//            totalPages = try movieContainer.decode(Int.self, forKey: .totalPages)
//            //results = try movieContainer.decode([Results].self, forKey: .results)
//
//            if let resultContainer = try? movieContainer.nestedContainer(keyedBy: ResultCodingKeys.self, forKey: .results) {
//                self.popularity = try resultContainer.decode(Double.self, forKey: .popularity)
//                self.id = try resultContainer.decode(Int.self, forKey: .id)
//                self.video = try resultContainer.decode(Bool.self, forKey: .video)
//                self.voteCount = try resultContainer.decode(Int.self, forKey: .voteCount)
//                self.voteAverage = try resultContainer.decode(Int.self, forKey: .voteAverage)
//                self.title = try resultContainer.decode(String.self, forKey: .title)
//                self.releaseDate = try resultContainer.decode(String.self, forKey: .releaseDate)
//                self.originalLanguage = try resultContainer.decode(String.self, forKey: .originalLanguage)
//                self.originalTitle = try resultContainer.decode(String.self, forKey: .originalTitle)
//                self.backdropPath = try resultContainer.decode(String.self, forKey: .backdropPath)
//                self.adult = try resultContainer.decode(Bool.self, forKey: .adult)
//                self.overview = try resultContainer.decode(String.self, forKey: .overview)
//                self.posterPath = try resultContainer.decode(String.self, forKey: .posterPath)
//            }
//        }
    }
    
    
}

 */
