//
//  ViewController.swift
//  fumo
//
//  Created by Nick Jones on 08/09/2015.
//  Copyright © 2015 fumo. All rights reserved.
//

import UIKit
//import SystemConfiguration

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let reachability: Reachability = Reachability.reachabilityForInternetConnection()
        print(reachability.isReachableViaWiFi())
        print(reachability.isReachableViaWWAN())
        print(reachability.isReachable())
        print(reachability.currentReachabilityStatus)
        print(reachability.currentReachabilityString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

