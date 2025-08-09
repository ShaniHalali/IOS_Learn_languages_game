//
//  RankTableViewCell.swift
//  PlayWords
//
//  Created by Shani Halali on 09/08/2025.
//

import UIKit

class RankTableViewCell: UITableViewCell {

    
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(userRank: UserRank, place: Int) {
        placeLabel.text = "\(place)"
        nameLabel.text = "\(userRank.username)"
        scoreLabel.text = "\(userRank.score)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
