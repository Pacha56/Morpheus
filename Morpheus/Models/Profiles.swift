//
//  Profile.swift
//  Morpheus
//
//  Created by Luis Resende on 10/12/2020.
//

struct Profiles: Codable {
    
    var profiles: [Profile]
    
    enum TopLevelCodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopLevelCodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
           let list = try dataContainer.decode([Profile].self, forKey: .profiles)
        
        profiles = list
    }
}
