//
//  ProfileService.swift
//  Morpheus
//
//  Created by Luis Resende on 10/12/2020.
//

import Foundation

enum ProfileService: ServiceProtocol {
    
    case credentials(username: String, password: String)
    
    var baseURL: URL {
        return URL(string: "​​https://ypznjlmial.execute-api.us-east-1.amazonaws.com/DummyProfileLis")!
    }
    
    var path: String {
        ""
    }
        
    var method: HTTPMethod {
        return .post
    }
    
    var task: Task {
        let parameters = ["username": ""]
        return .requestParameters(parameters)
    }
    
    var headers: Headers? {
        return ["authorization": ""]
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
