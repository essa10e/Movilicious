//
//  SearchViewController.swift
//  Movilicious
//  Created by ESSA AL on 8/3/20.
//

import UIKit
import SDWebImage

var recentSearch = ["hi"]

class SearchViewController: UITableViewController {
    
    var movieStruct = [MovieResult]();
    var tvStruct = [TVResults]();
    var CHOICE = 0;
    
    let imgPathURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    let placeHolderImage = UIImage(named: "poster-not-available")!
    var activity = ActivityIndicator()
    
    // UISearchController:
    lazy var searchController: UISearchController = {
        var sc = UISearchController()
        sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.searchBar.delegate = self
        // show the keyboard when search icon clicked.
        //sc.searchBar.becomeFirstResponder()
        sc.searchBar.keyboardAppearance = .dark
        sc.searchBar.tintColor = .white
        sc.searchBar.placeholder = "Search Movies or TV"
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.sizeToFit()
        sc.searchBar.searchBarStyle = .prominent
        sc.searchBar.scopeButtonTitles = ["Movies", "TV"]
        // without this line I got warning message to implement it:
        // must have definesPresentationContext set to YES.
        sc.definesPresentationContext = true
        
        return sc
    }()
    
    // RecentSearch TableView:
    let recentSearchTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .yellow
        tv.separatorStyle = .none
        tv.allowsSelection = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bluishColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        // Background Color:
        view.backgroundColor = bluishColor
        
        navigationItem.title = "Search"
        //navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        //searchController
        navigationItem.searchController = searchController

        // Register Header:
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "headerID")
        tableView.sectionHeaderHeight = 50
        
        // Register Cell:
        tableView.register(MovieTVshowCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = bluishColor
        tableView.separatorStyle = .none
        
        
        
        recentSearchTableView.delegate = self
        recentSearchTableView.dataSource = self
        recentSearchTableView.register(recentSearchCell.self, forCellReuseIdentifier: "SearchCell")
        view.addSubview(recentSearchTableView)
        NSLayoutConstraint.activate([
            recentSearchTableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            recentSearchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            recentSearchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        ])
        
    }
}

/*
 ---------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------
 */

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("1")
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope == 0 {
            searchBar.placeholder = "Search Movies"
        } else {
            searchBar.placeholder = "Search TV"
        }
        CHOICE = selectedScope
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let word = searchBar.text!
        
        if !word.isEmpty {
            switch CHOICE {
                case 0:
                    let apiMovieQuery = "https://api.themoviedb.org/3/search/movie?query="+word+"&api_key=a371c5610f0c6993a57a2a4b88a93fa4"

                    // Fetch Movie Json API:
                    if let url = URL(string: apiMovieQuery) {
                        if let data = try? Data(contentsOf: url) {
                            if let jsonMovie = try? JSONDecoder().decode(Movie.self, from: data) {
                                movieStruct = jsonMovie.results
                                
                            }
                        }
                    }
                    
                    if movieStruct.isEmpty {
                        print("No Results...")
                    } else {
                        print("Movie Count: \(movieStruct.count)")
                    }
                case 1:
                    let apiTVQuery = "https://api.themoviedb.org/3/search/tv?query="+word+"&api_key=a371c5610f0c6993a57a2a4b88a93fa4"
                    // Fetching TV Json API:
                    if let url = URL(string: apiTVQuery) {
                        if let data = try? Data(contentsOf: url) {
                            if let jsonTV = try? JSONDecoder().decode(TV.self, from: data) {
                                tvStruct = jsonTV.results
                                
                            }
                        }
                    }
                    
                    if tvStruct.isEmpty {
                        print("No Results...")
                    } else {
                        print("TV Count: \(tvStruct.count)")
                    }
                default:
                    print("")
                }
            }
        
        // Append the new search word to 'recentSearch array':
        if !word.isEmpty {
            recentSearch.append(word)
            recentSearch.reverse()
            tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("3")
        // show the recent search words uitableview.
    }
}


/* TABLE VIEW EXTENSION: */
extension SearchViewController/*: UITableViewDelegate, UITableViewDataSource */ {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CHOICE == 0 {
            return movieStruct.count
        } else {
            return tvStruct.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Movies Search:
        if CHOICE == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTVshowCell
            cell.titleLabel.text = movieStruct[indexPath.row].original_title!
            cell.previewText.text = movieStruct[indexPath.row].overview!
            
            activity.displayActivity(view: cell.posterImage)
            activity.startAnimating()
            
            let remoteImage = imgPathURL.appendingPathComponent(movieStruct[indexPath.row].poster_path ?? "")
            
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
            // TV search:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTVshowCell
            cell.titleLabel.text = tvStruct[indexPath.row].original_name!
            cell.previewText.text = tvStruct[indexPath.row].overview!
            
            activity.displayActivity(view: cell.posterImage)
            activity.startAnimating()
            
            let remoteImage = imgPathURL.appendingPathComponent(tvStruct[indexPath.row].poster_path ?? "")
            
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailview = DetailView()
        
        if CHOICE == 0 {
            let MOVIE = movieStruct[indexPath.row]
            detailview.setMovieData(moData: MOVIE)
            navigationController?.pushViewController(DetailView(), animated: true)
            
        } else {
            let TV = tvStruct[indexPath.row]
            detailview.setTVData(tvData: TV)
            navigationController?.pushViewController(DetailView(), animated: true)
        }
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerID")
    }
}

/*
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
 */


// Recent Search TableView Header:
class Header: UITableViewHeaderFooterView {
    
    var searchViewController: SearchViewController?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let wordLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        //lb.text = "Recent Search"
        //lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    
    let clearBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Clear", for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    func setUpView() {
        addSubview(wordLabel)
        addSubview(clearBtn)
        
        clearBtn.addTarget(self, action: #selector(Header.clear_btn), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            wordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 9),
            
            clearBtn.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            clearBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
        ])
    }
    
    @objc func clear_btn() {
        print("Clear Search History.")
        recentSearch.removeAll()
        searchViewController?.tableView.reloadData()
        //show a notification on screen when this done:
    }
}

