//
//  ServiceManager.swift
//  ware
//
//  Created by Luis Resende on 21/07/2020.
//  Copyright © 2020 AppLaunch Limited. All rights reserved.
//

import Foundation

public class ServiceManager
{
    static let shared = ServiceManager()
    
    fileprivate enum endPoints : String
    {
        case login = "https://ho0lwtvpzh.execute-api.us-east-1.amazonaws.com/DummyLogin"
        case profiles = "https://ypznjlmial.execute-api.us-east-1.amazonaws.com/DummyProfileList"
    }
}

extension ServiceManager
{
    func login(username: String, password: String, completion: @escaping(AuthToken?, String?) -> Void)
    {
        let body: [String: Any] = ["username": username, "password": password]
        let bodyData = try? JSONSerialization.data(withJSONObject: body)
        
        sendRequest(endPoint: endPoints.login, method: .post, body: bodyData, headers: nil) { (result) in
            
            if let data = result
            {
                do
                {
                    let tokens = try JSONDecoder().decode(AuthToken.self, from: data)
                    
                    completion(tokens, nil)
                    return
                }
                catch let error
                {
                    completion(nil, error.localizedDescription)
                }
            }
            
            completion(nil, "An error occurred")
        }
    }
    
    func getProfiles(completion: @escaping([Profile]?, String?) -> Void)
    {
        guard let token = UserDefaults.standard.value(forKey: "authToken") as? String else {
            completion(nil, "Invalid token")
            return
        }
        
        let headers = [Header.authorization.rawValue:token]

        sendRequest(endPoint: endPoints.profiles, method: .get, body: nil, headers: headers) { (result) in

            if let data = result
            {
                do
                {
                    let profiles = try JSONDecoder().decode(Profiles.self, from: data)

                    completion(profiles.profiles, nil)
                    return
                }
                catch let error
                {
                    completion(nil, error.localizedDescription)
                }
            }

            completion(nil, "An error occurred")
        }
    }
    
    fileprivate func sendRequest(endPoint: endPoints, method: HTTPMethod, body: Data?, headers: [String:String]?, completion: @escaping(Data?) -> Void)
    {
        let session = URLSession.shared
        
        let url = endPoint.rawValue
        
        var components = URLComponents(string: url)!
        
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        var request = URLRequest(url: components.url!)
        
        if headers != nil
        {
            for header in headers!
            {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        if let body = body
        {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody =  body
        }
        
        request.httpMethod = method.rawValue
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if error != nil
            {
                completion(nil)
                return;
            }
            
            completion(data)
        })
        
        task.resume()
    }
}
