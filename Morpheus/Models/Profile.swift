//
//  Profile.swift
//  Morpheus
//
//  Created by Luis Resende on 11/12/2020.
//

struct Profile: Codable {
    
    var name: String
    var starLevel: Int
    var distanceFromUser: String
    var numRatings: Int
    var enabled: Bool
    var profileImage: String
    
    var distanceInMiles: String
    {
        let trimmedDistance = distanceFromUser.replacingOccurrences(of: "m", with: "")
        return "\(trimmedDistance) miles away"
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case starLevel = "star_level"
        case distanceFromUser = "distance_from_user"
        case numRatings = "num_ratings"
        case enabled
        case profileImage = "profile_image"
    }
}
