//
//  ProfileTableViewCell.swift
//  Morpheus
//
//  Created by Luis Resende on 10/12/2020.
//

import UIKit
import Kingfisher

class ProfileTableViewCell: UITableViewCell
{
    @IBOutlet weak var innerContainerView: UIView!
    @IBOutlet weak var topRatedLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var contactButton: UIButton!
    
    var profile: Profile? {
        didSet {
            guard let currentProfile = profile else { return }
            
            
            nameLabel.text = currentProfile.name
            distanceLabel.text = currentProfile.distanceInMiles
            ratingLabel.text = "(\(currentProfile.numRatings))"
            
            if let url = URL(string: currentProfile.profileImage)
            {
                profileImageView.kf.setImage(with: url)
            }
        }
    }
    
    var isTopRated = false
    {
        didSet
        {
            topRatedLabel.isHidden = !isTopRated
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        innerContainerView.layer.masksToBounds = true
        innerContainerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        innerContainerView.layer.cornerRadius = 16
        
        let color = UIColor(red: 44 / 255, green: 7 / 255, blue: 151 / 255, alpha: 1)
    
        topRatedLabel.backgroundColor = color
        contactButton.backgroundColor = color
        
        topRatedLabel.isHidden = true
    }
}
