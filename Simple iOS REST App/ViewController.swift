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
        let session = Session(
            login: loginField.text,
            password: passwordField.text
        )
        
        session.authenticate()

    }
}

