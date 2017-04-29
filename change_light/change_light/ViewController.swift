//
//  ViewController.swift
//  change_light
//
//  Created by 楊喬宇 on 2017/4/29.
//  Copyright © 2017年 楊喬宇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputBar: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    var request = URLRequest(url: URL(string: "http://10.20.12.189:8080/light_num")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.sendBtn.isUserInteractionEnabled = false
        self.sendBtn.alpha = 0.3
    }
    
    @IBAction func checkText(_ sender: Any) {
        if (self.inputBar.text?.isEmpty)! {
            self.sendBtn.isUserInteractionEnabled = false
            self.sendBtn.alpha = 0.3
        } else {
            self.sendBtn.isUserInteractionEnabled = true
            self.sendBtn.alpha = 1.0
        }
    }
    
    @IBAction func sendNum(_ sender: Any) {
        request.httpMethod = "POST"
        let postString = "light=\(self.inputBar.text!)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

