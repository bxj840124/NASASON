//
//  settingPage.swift
//  Dinner_client
//
//  Created by 楊喬宇 on 2017/4/30.
//  Copyright © 2017年 楊喬宇. All rights reserved.
//

import UIKit

class settingPage: UIViewController {

    @IBOutlet weak var assignLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.assignLabel.alpha = 0.0
        self.stateLabel.alpha = 0.0
        self.playBtn.alpha = 0.0
        self.playBtn.isUserInteractionEnabled = false
        self.assignLabel.center.y = self.view.center.y - 40
        self.stateLabel.center.y = self.view.center.y
        UIView.animate(withDuration: 1.5, animations: {
            
            self.assignLabel.alpha = 1.0
            self.assignLabel.center.y = self.view.center.y - 70
            
        }, completion: {(finished:Bool) in
            
            UIView.animate(withDuration: 1.5, animations: {
                
                self.stateLabel.alpha = 1.0
                self.stateLabel.center.y = self.view.center.y - 20
                
            }, completion: {(finished:Bool) in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    self.playBtn.alpha = 1.0
                    self.playBtn.isUserInteractionEnabled = true
                })
            })
            
        })
        
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
