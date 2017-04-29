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
    
    var userName: String = ""
    let jobs = ["farmer", "cook", "dairyman", "merchant", "citizen"]
    var randomIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadingLabel.text = "Connecting Server"
        self.loadingImg.hidesWhenStopped = true
        self.loadingImg.startAnimating()
        
        randomIndex = Int(arc4random_uniform(UInt32(self.jobs.count)))
        
        var request = URLRequest(url: URL(string: "http://127.0.0.1:8080/player")!)
        request.httpMethod = "POST"
        let postString = "name=\(userName)&job=\(jobs[randomIndex])&currency=10000"
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
        
        self.loadingLabel.text = "Done"
        self.loadingImg.stopAnimating()
        
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
