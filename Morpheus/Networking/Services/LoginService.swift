//
//  PostService.swift
//  HorseRacing
//
//  Created by Luis Resende on 05/12/2020.
//

import Foundation

enum LoginService: ServiceProtocol {
    
    case credentials(username: String, password: String)
    
    var baseURL: URL {
        let urlString = "https://ho0lwtvpzh.execute-api.us-east-1.amazonaws.com/DummyLogin"
            
        return URL(string: urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
    }
    
    var path: String {
        ""
    }
        
    var method: HTTPMethod {
        return .post
    }
    
    var task: Task {
        let parameters = ["username": "user@morpheustest.com", "password": "Password1"]
        return .requestParameters(parameters)
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parametersEncoding: ParametersEncoding {
        return .json
    }
}
