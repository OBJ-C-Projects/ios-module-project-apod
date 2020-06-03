//
//  ViewController.swift
//  Astronomy Picture of the Day
//
//  Created by FGT MAC on 6/2/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var fetch = FGTNetworkFetch()
    
    
    @IBOutlet weak var checkoutButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetch.fetchPhotos("June") { (data, error) in
            
            print("Data: \(data.url)")
        }
      
    }


}

