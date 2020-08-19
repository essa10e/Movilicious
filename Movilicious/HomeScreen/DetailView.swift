//
//  DetailView.swift
//  Movilicious
//

import UIKit
import SDWebImage

var section: String = ""
var movieDetail: MovieResult? = nil
var tvDetail: TVResults? = nil

class DetailView: UIViewController {
    
    var activity = ActivityIndicator()
    let placeHolderImage = UIImage(named: "poster-not-available")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        
        // For some reason. when pushed from SearchView. this navigationbar is set to hidden?! "Fix Me"
        navigationController?.setNavigationBarHidden(false, animated: true)
        let a = navigationController?.isNavigationBarHidden
        print("=navigationBar ishidden= \(a!)")
        
        let imgPathURL = URL(string: "https://image.tmdb.org/t/p/w500")!
        
        
        if section == "Movie" {
            // Navigation Title:
            navigationItem.title =  movieDetail?.title ?? "Title..."
            
            // Movie DETAILS ...................................
            let remoteImage = imgPathURL.appendingPathComponent(movieDetail?.poster_path ?? "")
            
            activity.startAnimating()
            
            posterImage.sd_setImage(with: remoteImage,
                                    placeholderImage: placeHolderImage,
                                    options: SDWebImageOptions.continueInBackground,
                                    progress: nil) { (downloadedImage, downloadException, cacheType, downloadURL) in
                                        if let downloadException = downloadException {
                                            print("Error Downloading the image: \(downloadException.localizedDescription)")
                                        } else {
                                            print("Successfuly downloaded image: \(downloadURL?.absoluteString ?? "")")
                                        }
                                        
                                        self.activity.stopAnimating()
            }
            titleLabel.text = movieDetail?.original_title
            let date = movieDetail?.release_date
            releaseDate.text = "\(date ?? "")"
            
            let voteAvg = movieDetail?.vote_average
            voteAverage.text = "\(voteAvg!) / 10"
            overviewText.text = movieDetail?.overview
            
            let language = movieDetail?.original_language!
            languageList.text = "\(language!.uppercased())"
            
            let genre = movieDetail?.genre_ids!
            for i in genre! {
                if GENRES_LIST.keys.contains(i) {
                    genreList.text?.append("\(GENRES_LIST[i]!)  ")
                }
            }
            
            
        } else {
            // Navigation Title:
            navigationItem.title =  tvDetail?.name ?? "Title..."
            
            // TV DETAILS.......................................
            let remoteImage = imgPathURL.appendingPathComponent(tvDetail?.poster_path ?? "")
            
            activity.startAnimating()
            
            posterImage.sd_setImage(with: remoteImage,
                                    placeholderImage: nil,
                                    options: SDWebImageOptions.continueInBackground,
                                    progress: nil) { (downloadedImage, downloadException, cacheType, downloadURL) in
                                        if let downloadException = downloadException {
                                            print("Error Downloading the image: \(downloadException.localizedDescription)")
                                        } else {
                                            print("Successfuly downloaded image: \(downloadURL?.absoluteString ?? "")")
                                        }
                                        
                                        self.activity.stopAnimating()
            }
            titleLabel.text = tvDetail?.original_name
            let date = tvDetail?.first_air_date
            releaseDate.text = "\(date ?? "")"
            
            let voteAvg = tvDetail?.vote_average
            voteAverage.text = "\(voteAvg!) / 10"
            overviewText.text = tvDetail?.overview
            
            let language = tvDetail?.original_language!
            languageList.text = "\(language!.uppercased())"
            
            let genre = tvDetail?.genre_ids!
            for i in genre! {
                if GENRES_LIST.keys.contains(i) {
                    genreList.text?.append("\(GENRES_LIST[i]!)  ")
                }
            }
        }
        
        
        view.addSubview(scrollableView)
        scrollableView.addSubview(containerView)
        containerView.addSubview(posterImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(seperator1) // -------------- seperator 1.
        containerView.addSubview(releaseDateLabel)
        containerView.addSubview(voteAverageLabel)
        containerView.addSubview(releaseDate)
        containerView.addSubview(voteAverage)
        containerView.addSubview(languageLabel)
        containerView.addSubview(languageList)
        containerView.addSubview(overviewText)
        containerView.addSubview(seperator2) // -------------- seperator 2.
        containerView.addSubview(genreLabel)
        containerView.addSubview(genreList)
        
        NSLayoutConstraint.activate([
            // ScrollView:
            scrollableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Container View:
            containerView.topAnchor.constraint(equalTo: scrollableView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollableView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollableView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollableView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollableView.widthAnchor),
            containerView.heightAnchor.constraint(equalTo: scrollableView.heightAnchor),
            
            // Poster Image:
            posterImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6),
            posterImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            posterImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            posterImage.heightAnchor.constraint(equalToConstant: 400),
            
            // Title:
            titleLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 7),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // Seperator 1 :-------------------------------------------------------------------
            seperator1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            seperator1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            seperator1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            seperator1.heightAnchor.constraint(equalToConstant: 1),
            
            // Release Date Label:
            releaseDateLabel.topAnchor.constraint(equalTo: seperator1.bottomAnchor, constant: 4),
            releaseDateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            releaseDateLabel.trailingAnchor.constraint(equalTo: voteAverageLabel.leadingAnchor, constant: -5),
            releaseDateLabel.heightAnchor.constraint(equalToConstant: 35),
            releaseDateLabel.widthAnchor.constraint(equalToConstant: containerView.frame.width/2),
            // Vote Average Label:
            voteAverageLabel.topAnchor.constraint(equalTo: seperator1.bottomAnchor, constant: 4),
            voteAverageLabel.leadingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor, constant: 5),
            voteAverageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            voteAverageLabel.heightAnchor.constraint(equalToConstant: 35),
            
            // Rlease Date:
            releaseDate.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 5),
            releaseDate.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            releaseDate.trailingAnchor.constraint(equalTo: voteAverage.leadingAnchor, constant: -5),
            releaseDate.heightAnchor.constraint(equalToConstant: 35),
            releaseDate.widthAnchor.constraint(equalToConstant: containerView.frame.width/2),

            // Vote Average:
            voteAverage.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor, constant: 4),
            voteAverage.leadingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor, constant: 5),
            voteAverage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            voteAverage.heightAnchor.constraint(equalToConstant: 35),
            //voteAverage.widthAnchor.constraint(equalToConstant: containerView.frame.width/2),
            
            
            // Language:
            languageLabel.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 8),
            languageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            languageLabel.trailingAnchor.constraint(equalTo: languageList.leadingAnchor, constant: -5),
            languageLabel.heightAnchor.constraint(equalToConstant: 30),
            
            languageList.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 8),
            languageList.leadingAnchor.constraint(equalTo: languageLabel.trailingAnchor, constant: 5),
            languageList.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            languageList.heightAnchor.constraint(equalToConstant: 30),
            
            
            // Overview:
            overviewText.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 7),
            overviewText.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            overviewText.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            //overviewText.heightAnchor.constraint(equalToConstant: 350),
            
            // Seperator 2 :-------------------------------------------------------------------
            seperator2.topAnchor.constraint(equalTo: overviewText.bottomAnchor, constant: 2),
            seperator2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            seperator2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            seperator2.heightAnchor.constraint(equalToConstant: 1),
            
            // Genre Label:
            genreLabel.topAnchor.constraint(equalTo: seperator2.bottomAnchor, constant: 7),
            genreLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            genreLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            //genreLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            genreLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // Genre List:
            genreList.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 5),
            genreList.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            genreList.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            genreList.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            genreList.heightAnchor.constraint(equalToConstant: 30),
        ])
        
    }
    
    func setMovieData(moData: MovieResult?) {
        movieDetail = moData
        section = "Movie"
    }
    func setTVData(tvData: TVResults?) {
        tvDetail = tvData
        section = "TV"
    }
    
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 1400)
    // ScrollView:
    lazy var scrollableView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.frame = self.view.bounds
        scroll.contentSize = contentViewSize
        scroll.autoresizingMask = .flexibleHeight
        //scroll.showsHorizontalScrollIndicator = true
        //scroll.showsVerticalScrollIndicator = true
        scroll.bounces = true
        return scroll
    }()
    
    // Seperator:
    let seperator1: UIView = {
        let sView = UIView(frame: .zero)
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.backgroundColor = .gray
        return sView
    }()
    // Seperator:
    let seperator2: UIView = {
        let sView = UIView(frame: .zero)
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.backgroundColor = .gray
        return sView
    }()
    // Seperator:
    let seperator3: UIView = {
        let sView = UIView(frame: .zero)
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.backgroundColor = .gray
        return sView
    }()
    
    // Container - UIView:
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame.size = contentViewSize
        //view.backgroundColor = .yellow
        view.layer.cornerRadius = 10
        return view
    }()
    
    // Poster:
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        //img.backgroundColor = .green
        return img
    }()
    
    // Title:
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        //lb.text = "Title Label Goes Here"
        //lb.backgroundColor = .orange
        lb.font = UIFont.boldSystemFont(ofSize: 30)
        lb.textColor = .white
        lb.numberOfLines = 1
        return lb
    }()
    
    // Language Label:
    let languageLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Language: "
        //lb.backgroundColor = .orange
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        lb.textColor = .red
        lb.numberOfLines = 1
        return lb
    }()
    // Language:
    let languageList: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Language list"
        //lb.backgroundColor = .orange
        lb.font = UIFont.systemFont(ofSize: 22)
        lb.textColor = .white
        lb.numberOfLines = 1
        return lb
    }()
    
    // Genre:
    let genreLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Genre:"
        //lb.backgroundColor = .purple
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        lb.textColor = .red
        lb.numberOfLines = 1
        return lb
    }()
    
    // Genre:
    let genreList: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = ""
        //lb.backgroundColor = .purple
        lb.font = UIFont.systemFont(ofSize: 22)
        lb.textColor = .white
        lb.numberOfLines = 1
        return lb
    }()
    
    
    /// Vote Average Lable:
    let voteAverageLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Rating:"
        lb.textAlignment = .right
        //lb.backgroundColor = .orange
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        lb.textColor = .red
        lb.numberOfLines = 1
        return lb
    }()
    // Vote Average:
    let voteAverage: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        //lb.text = "Vote Average."
        lb.textAlignment = .right
        //lb.backgroundColor = .orange
        lb.font = UIFont.systemFont(ofSize: 22)
        lb.textColor = .white
        lb.numberOfLines = 1
        return lb
    }()
    // LABEL:
    
    // Release Date Label:
    let releaseDateLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Release Date:"
        //lb.backgroundColor = .orange
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        lb.textColor = .red
        lb.numberOfLines = 1
        return lb
    }()
    // Release Date:
    let releaseDate: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Date"
        //lb.backgroundColor = .orange
        lb.font = UIFont.systemFont(ofSize: 22)
        lb.textColor = .white
        lb.numberOfLines = 1
        return lb
    }()
    
    
    // Oreview:
    let overviewText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.backgroundColor = .clear
        lb.text = "This is just a test"
        // TODO: fix size.
        lb.sizeToFit()
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.font = UIFont.systemFont(ofSize: 22)
        return lb
    }()
    
}


