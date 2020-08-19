//
//  HomeDataSource.swift
//  Movilicious
//

import UIKit
import SDWebImage

class HomeDataSource: NSObject, UICollectionViewDataSource {
    var genreStruct = [GenreResults]()
    var trendingMO = [MovieResult]()
    var trendingTV = [TVResults]()
    
    let imgPathURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    let placeHolderImage = UIImage(named: "poster-not-available")!
    var activity = ActivityIndicator()
    
    let genreAPI = "https://api.themoviedb.org/3/genre/movie/list?&api_key=a371c5610f0c6993a57a2a4b88a93fa4"
    let trendingTV_API = "https://api.themoviedb.org/3/trending/tv/day?&api_key=a371c5610f0c6993a57a2a4b88a93fa4"
    let trendingMOVIE_API = "https://api.themoviedb.org/3/trending/movie/day?&api_key=a371c5610f0c6993a57a2a4b88a93fa4"
    
    // Fetch Data:
    func fetchData() {
        // Fetching Genre JSON API:
         // Fetch Genre api: '' USE Semaphore here to load this first''
         if let genreURL = URL(string: genreAPI) {
            if let genre = try? Data(contentsOf: genreURL) {
                if let jsonGenre = try? JSONDecoder().decode(Genre.self, from: genre) {
                    genreStruct = jsonGenre.genres
                }
            }
         }
         
         // Fetch Trending TV API:
         if let trendingTVURL = URL(string: trendingTV_API) {
            if let trend = try? Data(contentsOf: trendingTVURL) {
                if let jsonTrend = try? JSONDecoder().decode(TrendingTV.self, from: trend) {
                    trendingTV = jsonTrend.results
                }
            }
         }
         
         // Fetch Trending Movie API:
         if let trendingMovieURL = URL(string: trendingMOVIE_API) {
            if let trend = try? Data(contentsOf: trendingMovieURL) {
                if let jsonTrend = try? JSONDecoder().decode(TrendingMO.self, from: trend) {
                    trendingMO = jsonTrend.results
                }
            }
         }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return trendingMO.count
        } else {
            return trendingTV.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Trending Movies Section:
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mtCell", for: indexPath) as! MovieTVCollectionViewCell
            
            cell.titleLabel.text = "#\(indexPath.item + 1) " + trendingMO[indexPath.item].original_title!
            
            activity.displayActivity(view: cell.posterImage)
            activity.startAnimating()
            
            let remoteImage = imgPathURL.appendingPathComponent(trendingMO[indexPath.item].poster_path ?? "")
            
            cell.posterImage.sd_setImage(with: remoteImage,
                                         placeholderImage: placeHolderImage,
                                         options: SDWebImageOptions.highPriority,
                                         progress: nil) { (downloadedImage, downloadException, cacheType, downloadURL) in
                                            if let downloadException = downloadException {
                                                print("Error Downloading the image: \(downloadException.localizedDescription)")
                                            } else {
                                                print("Successfuly downloaded image: \(downloadURL?.absoluteString ?? "")")
                                            }
                                            
                                            self.activity.stopAnimating()
            }
            
            return cell
        } else {
            // Trending TV Section:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mtCell", for: indexPath) as! MovieTVCollectionViewCell
            
            cell.titleLabel.text = "#\(indexPath.item + 1) " + trendingTV[indexPath.item].original_name!
            
            activity.displayActivity(view: cell.posterImage)
            activity.startAnimating()
            
            let remoteImage = imgPathURL.appendingPathComponent(trendingTV[indexPath.item].poster_path ?? "")
            
            cell.posterImage.sd_setImage(with: remoteImage,
                                         placeholderImage: placeHolderImage,
                                         options: SDWebImageOptions.highPriority,
                                         progress: nil) { (downloadedImage, downloadException, cacheType, downloadURL) in
                                            if let downloadException = downloadException {
                                                print("Error Downloading the image: \(downloadException.localizedDescription)")
                                            } else {
                                                print("Successfuly downloaded image: \(downloadURL?.absoluteString ?? "")")
                                            }
                                            
                                            self.activity.stopAnimating()
            }
            
            return cell
        }
    }
}
