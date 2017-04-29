//
//  buttonFlash.swift
//  Dinner_client
//
//  Created by 楊喬宇 on 2017/4/26.
//  Copyright © 2017年 楊喬宇. All rights reserved.
//

import UIKit

class buttonFlash: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
        // Drawing code
        UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseOut, .repeat, .autoreverse, .allowUserInteraction], animations: {
            
            self.alpha = 0.1
            
        }, completion: nil)
    }
}
