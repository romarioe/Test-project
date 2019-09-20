//
//  NetworkService.swift
//  KubanTestProject
//
//  Created by Roman Efimov on 17/09/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import Foundation

class NetworkService{
    
    
    
    func request(completion: @escaping (Data?, URLResponse?, Error?) -> Void)  {
        let settings = Settings()
        
        var components = URLComponents()
        components.scheme = settings.getScheme()
        components.host = settings.getHost()
        components.path = settings.getPath()
        
        guard let url = components.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["Authorization": settings.getToken()]
        
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
 

    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }
    }
    
    
}
