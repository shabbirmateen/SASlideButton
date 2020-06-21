//
//  ViewController.swift
//  SlideButtonSample
//
//  Created by mp-dev on 6/21/20.
//  Copyright © 2020 Shabbir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonView:SASlideButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        buttonView.didButtonCalled = { tag in
            print("button called successfully with tag \(tag)")
           
        }
    }


}

