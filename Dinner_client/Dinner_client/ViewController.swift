//
//  ViewController.swift
//  Dinner_client
//
//  Created by 楊喬宇 on 2017/4/26.
//  Copyright © 2017年 楊喬宇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var appLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.appLogo.alpha = 0.0
        self.startButton.isHidden = true
        self.gameTitle.alpha = 0.0
        self.gameTitle.center.y = self.view.center.y
        UIView.animate(withDuration: 1.5, animations: {
            
            self.appLogo.alpha = 1.0
            self.gameTitle.alpha = 1.0
            self.gameTitle.center.y = self.view.center.y - 70
            
        }, completion: {(finished:Bool) in
            
            self.startButton.isHidden = false
            self.startButton.isEnabled = true
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

