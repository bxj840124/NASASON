//
//  connectPage.swift
//  Dinner_client
//
//  Created by 楊喬宇 on 2017/4/27.
//  Copyright © 2017年 楊喬宇. All rights reserved.
//

import UIKit

class connectPage: UIViewController {

    @IBOutlet weak var loadingImg: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var goNext: UIButton!
    
    var userName: String = ""
    //let jobs = ["farmer", "cook", "dairyman", "merchant", "citizen"]
    var randomIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.goNext.isHidden = true
        self.goNext.isUserInteractionEnabled = false
        self.loadingLabel.text = "Connecting Server"
        self.loadingLabel.alpha = 0.0
        self.loadingLabel.center.y = self.view.center.y - 40
        self.loadingImg.hidesWhenStopped = true
        self.loadingImg.isHidden = true
        UIView.animate(withDuration: 1.5, animations: {
            
            self.loadingLabel.alpha = 1.0
            self.loadingLabel.center.y = self.view.center.y - 70
            
        }, completion: {(finished:Bool) in
            
            self.loadingImg.isHidden = false
            self.loadingImg.startAnimating()
        })
        
        /*
        randomIndex = Int(arc4random_uniform(UInt32(self.jobs.count)))
        
        var request = URLRequest(url: URL(string: "http://127.0.0.1:8080/player")!)
        request.httpMethod = "POST"
        let postString = "name=\(userName)&job=\(jobs[randomIndex])&currency=100000"
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
        */
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            // Put your code which should be executed with a delay here
            UIView.animate(withDuration: 1.5, animations: {
                
                self.loadingLabel.text = "Done"
                self.loadingImg.stopAnimating()
                
            }, completion: {(finished:Bool) in
                
                self.goNext.isHidden = false
                self.goNext.alpha = 0.0
                self.goNext.isUserInteractionEnabled = false
                UIView.animate(withDuration: 1.5, animations: {
                    
                    self.goNext.alpha = 1.0
                    
                }, completion: {(finished:Bool) in
                    
                    self.goNext.isUserInteractionEnabled = true
                })
            })
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
