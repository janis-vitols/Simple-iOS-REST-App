//
//  Session.swift
//  Simple iOS REST App
//
//  Created by Vitols Janis on 22/09/15.
//
//

import Foundation

class Session {
    var login: String;
    var password: String;
    let myUrl = NSURL(string: "http://127.0.0.1:9999/login");
    
    init(login: String, password: String) {
        self.login    = login
        self.password = password
    }
    
    func authenticate() {
        let postString = "login=\(self.login)&password=\(self.password)";
        
        let request = NSMutableURLRequest(URL:self.myUrl!);
        request.HTTPMethod = "POST";
        request.HTTPBody   = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                println("error=\(error)")
                return
            }
            
            if let httpResponse = response as? NSHTTPURLResponse {
                let message = httpResponse.statusCode == 200 ? "Success" : "Fail"
                println(message)
            } // if let httpResponse
        } // let task
        
        task.resume()
        
    }
    
    
}