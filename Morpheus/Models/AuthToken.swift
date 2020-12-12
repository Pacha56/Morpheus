//
//  AuthToken.swift
//  Morpheus
//
//  Created by Luis Resende on 10/12/2020.
//

import Foundation

struct AuthToken: Codable
{
    var authToken: String
    var refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case authToken = "auth_token"
        case refreshToken = "refresh_token"
    }
    
    enum TopLevelCodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopLevelCodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        authToken = try dataContainer.decode(String.self, forKey: .authToken)
        refreshToken = try dataContainer.decode(String.self, forKey: .refreshToken)
    }
}
