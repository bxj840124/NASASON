//
//  playerInfo.swift
//  Dinner_client
//
//  Created by 楊喬宇 on 2017/4/26.
//  Copyright © 2017年 楊喬宇. All rights reserved.
//

import UIKit

class playerInfo: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var inputBar: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inputBar.delegate = self
        
        self.nextBtn.isUserInteractionEnabled = false
        self.nextBtn.alpha = 0.3
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkText(_ sender: Any) {
        if (self.inputBar.text?.isEmpty)! {
            self.nextBtn.isUserInteractionEnabled = false
            self.nextBtn.alpha = 0.3
        } else {
            self.nextBtn.isUserInteractionEnabled = true
            self.nextBtn.alpha = 1.0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.pageTitle.alpha = 0.0
        self.inputBar.isHidden = true
        self.nextBtn.isHidden = true
        self.pageTitle.center.y = self.view.center.y
        UIView.animate(withDuration: 1.5, animations: {
            
            self.pageTitle.alpha = 1.0
            self.pageTitle.center.y = self.view.center.y - 70
            
        }, completion: {(finished:Bool) in
            
            self.inputBar.isHidden = false
            self.nextBtn.isHidden = false
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConnect" {
            if let destination = segue.destination as? connectPage {
                destination.userName = self.inputBar.text!
                self.show(destination, sender: self)
            }
        }
    }
}
