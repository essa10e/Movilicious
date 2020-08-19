//
//  MoviesClass.swift
//  Movilicious
//
//  Created by ESSA AL on 7/30/20.
//




/*/ FETCHING FROM MOVIECLASS.SWIFT :: ''This code should be in ViewDidLoad() inside viewcontroller.''
 
 Movies.fetch(withId: word) { (newMovie) in
 //print("- \(newMovie.page!)")
 //print("- \(newMovie.id!)")
 for i in newMovie {
 print("- Page: \(i.page!)")
 print("- total_results: \(i.totalResult!)")
 print("- Title: \(i.id ?? -1)")
 }
 }
 */







/*
import Foundation

let API_KEY = "?api_key=a371c5610f0c6993a57a2a4b88a93fa4"
let TMDB_API = "https://api.themoviedb.org/3/movie/550" + API_KEY

// Movie structure:
class Movies : Codable {
    
    var page: Int?
    var totalResult: Int?
    var totalPages: Int?
    /* nested result: */
    var popularity: Double?
    var id: Int?
    var video: Bool?
    var voteCount: Int?
    var voteAverage: Double?
    var title: String?
    var releaseDate: String?
    var originalLanguage: String?
    var originalTitle: String?
    var backdropPath: String?
    var adult: Bool?
    var overview: String?
    var posterPath: String?
    var genre_ids: [Int]?
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalResult = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    private enum ResultCodingKeys: String, CodingKey {
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
        case genre_ids
        
    }
    //var results: [Results]?
    
    // Encoder:
    func encode(to encoder: Encoder) throws {
        //
    }
    
    required init(from decoder: Decoder) throws {
        if let movieContainer = try? decoder.container(keyedBy: CodingKeys.self) {
            page = try movieContainer.decode(Int.self, forKey: .page)
            totalResult = try movieContainer.decode(Int.self, forKey: .totalResult)
            totalPages = try movieContainer.decode(Int.self, forKey: .totalPages)
            //results = try movieContainer.decode([Results].self, forKey: .results)
            
            if let resultContainer = try? movieContainer.nestedContainer(keyedBy: ResultCodingKeys.self, forKey: .results) {
                self.popularity = try resultContainer.decode(Double.self, forKey: .popularity)
                self.id = try resultContainer.decode(Int.self, forKey: .id)
                self.video = try resultContainer.decode(Bool.self, forKey: .video)
                self.voteCount = try resultContainer.decode(Int.self, forKey: .voteCount)
                self.voteAverage = try resultContainer.decode(Double.self, forKey: .voteAverage)
                self.title = try resultContainer.decode(String.self, forKey: .title)
                self.releaseDate = try resultContainer.decode(String.self, forKey: .releaseDate)
                self.originalLanguage = try resultContainer.decode(String.self, forKey: .originalLanguage)
                self.originalTitle = try resultContainer.decode(String.self, forKey: .originalTitle)
                self.backdropPath = try resultContainer.decode(String.self, forKey: .backdropPath)
                self.adult = try resultContainer.decode(Bool.self, forKey: .adult)
                self.overview = try resultContainer.decode(String.self, forKey: .overview)
                self.posterPath = try resultContainer.decode(String.self, forKey: .posterPath)
                self.genre_ids = try resultContainer.decode([Int].self, forKey: .genre_ids)
            }
        }
    }
    
    static func fetch(withId word: String, compeletionHandler: @escaping ([Movies])->Void){
        let apiQuery = "https://api.themoviedb.org/3/search/movie?query="+word+"&api_key=a371c5610f0c6993a57a2a4b88a93fa4"
        guard let url = URL(string: apiQuery) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let movie = try JSONDecoder().decode(Movies.self, from: data)
                print(movie)
                print("--------------")
                //print(movie.results)
                print(movie.id ?? -2)
                //print(movie.overview!)
                
                print(String.init(data: data, encoding: .ascii) ?? "No Data")
                compeletionHandler([movie])
                /*
                 if let newMovie = try? JSONDecoder().decode(Movies.self, from: data) {
                 compeletionHandler(newMovie)
                 }
                 */
            } catch let jsonError {
                print("JSON searialization error", jsonError)
            }
            }.resume()
    }
}
*/
