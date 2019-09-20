//
//  Settings.swift
//  KubanTestProject
//
//  Created by Roman Efimov on 18/09/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import Foundation

class Settings{
    
    
    let defaultScheme = "https"
    let defaultHost = "portal.kubankredit.ru"
    let defaultPath = "/backend/rest/stateful/personal/ping"
    let defaultToken = ""
    let defaultTimeIntarval = "1"
    
 
    func saveSettings(scheme: String, server: String, endpoint: String, token: String, timeInterval: String){
        UserDefaults.standard.set(scheme, forKey: "scheme")
        UserDefaults.standard.set(server, forKey: "host")
        UserDefaults.standard.set(endpoint, forKey: "endpoint")
        UserDefaults.standard.set(token, forKey: "token")
        UserDefaults.standard.set(timeInterval, forKey: "interval")
    }
    
    
    
    func getScheme() -> String {
        var returnScheme = defaultScheme
        if let scheme = UserDefaults.standard.string(forKey: "scheme") {
            returnScheme = scheme
        }
        return returnScheme
    }
    
    
    func getHost() -> String {
        var returnHost = defaultHost
        if let host = UserDefaults.standard.string(forKey: "host") {
            returnHost = host
        }
        return returnHost
    }
    
    
    func getPath() -> String {
        var returnPath = defaultPath
        if let path = UserDefaults.standard.string(forKey: "endpoint") {
            returnPath = path
        }
        return returnPath
    }
    
    
    func getToken() -> String {
        var returnToken = defaultToken
        if let token = UserDefaults.standard.string(forKey: "token") {
            returnToken = token
        }
        return returnToken
    }
    


    
    func timeInterval() -> Double{
        var interval: Int = 1
        if let timeInterval = UserDefaults.standard.string(forKey: "interval") {
            interval = Int(timeInterval) ?? 1
        }
        return Double(interval)
    }
    
    
    func checkURL(scheme: String, server: String, endpoint: String) -> Bool {
        var urlStatus = false
        var components = URLComponents()
        components.scheme = scheme
        components.host = server
        components.path = endpoint
        
        if components.url != nil {
            urlStatus = true
            print ("URL = ", components.url!)
        }
        
        return urlStatus
    }
    

}
