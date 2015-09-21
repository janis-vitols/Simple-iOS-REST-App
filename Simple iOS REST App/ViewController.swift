//
//  ViewController.swift
//  Simple iOS REST App
//
//  Created by Vitols Janis on 21/09/15.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginClicked(sender: AnyObject) {
        let myUrl = NSURL(string: "http://127.0.0.1:9999/login");
        let login    = loginField.text
        let password = passwordField.text
        let postString = "login=\(login)&password=\(password)";
        let request = NSMutableURLRequest(URL:myUrl!);
            request.HTTPMethod = "POST";
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
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

