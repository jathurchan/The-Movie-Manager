//
//  MovieDetailViewController.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 22/04/2021.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var watchlistToolBarButton: UIBarButtonItem!
    @IBOutlet weak var favoriteToolBarButton: UIBarButtonItem!
    
    var movie: Movie!
    
    var isWatchlist: Bool {
        return MovieModel.watchlist.contains(movie)
    }
    
    var isFavorite: Bool {
        return MovieModel.favorites.contains(movie)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = movie.title
        
        toggleBarButton(watchlistToolBarButton, enabled: isWatchlist)
        toggleBarButton(favoriteToolBarButton, enabled: isFavorite)
        
        if let posterPath = movie.posterPath {
            TMDBClient.downloadPosterImage(posterPath: posterPath) { (data, error) in
                guard let data = data else {
                    return
                }
                
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }
        
    }
    
    @IBAction func watchlistButtonTapped(_ sender: Any) {
        TMDBClient.markWatchList(movieId: movie.id, watchlist: !isWatchlist, completion: handleWatchlistResponse(success:error:))
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        TMDBClient.markFavorite(movieId: movie.id, favorite: !isFavorite, completion: handleFavoriteResponse(success:error:))
    }
    
    func handleWatchlistResponse(success: Bool, error: Error?) {
        if success {
            if isWatchlist {
                MovieModel.watchlist = MovieModel.watchlist.filter() { $0 != self.movie}
            } else {
                MovieModel.watchlist.append(movie)
            }
            toggleBarButton(watchlistToolBarButton, enabled: isWatchlist)
        }
    }
    
    func handleFavoriteResponse(success: Bool, error: Error?) {
        if success {
            if isFavorite {
                MovieModel.favorites = MovieModel.favorites.filter() {$0 != self.movie}
            } else {
                MovieModel.favorites.append(movie)
            }
            toggleBarButton(favoriteToolBarButton, enabled: isFavorite)
        }
    }
    
    func toggleBarButton(_ button: UIBarButtonItem, enabled: Bool) {
        if enabled {
            button.tintColor = UIColor.systemBlue
        } else {
            button.tintColor = UIColor.systemGray
        }
    }
    
}
