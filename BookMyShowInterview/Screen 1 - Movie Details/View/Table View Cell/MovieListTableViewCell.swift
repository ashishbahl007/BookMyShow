//
//  MovieListTableViewCell.swift
//  BookMyShowInterview
//
//  Created by Ashish Bahl on 22/04/21.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    //MARK:- Outlets
    
    @IBOutlet weak var viewCardCell: UIView!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var buttonBook: UIButton!
    @IBOutlet weak var labelMovieTitle: UILabel!
    @IBOutlet weak var labelReleaseDetails: UILabel!
    @IBOutlet weak var labelPopularity: UILabel!
    @IBOutlet weak var labelOverView: UILabel!
    
    //MARK:- Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCardCell.layer.cornerRadius = 15
        viewCardCell.layer.borderWidth = 0.25
        viewCardCell.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
