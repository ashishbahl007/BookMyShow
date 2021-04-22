//
//  Constants.swift
//  BookMyShowInterview
//
//  Created by Ashish Bahl on 22/04/21.
//

import Foundation

public class Constants : NSObject {
    
    public static let API_KEY = "7bd7a805bafb2d308c18aa5e385b9da0"
    public static let API_URL_NOW_PLAYING = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(API_KEY)&language=en-US&page=1"
    
    public static let IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w500/"
    
    public static let MEDIA_CELL_IDENTIFIER = "movieListCell"
    public static let MEDIA_TABLE_VIEW_CELL = "MovieListTableViewCell"
}
