//
//  ViewController.swift
//  fumo
//
//  Created by Nick Jones on 08/09/2015.
//  Copyright © 2015 fumo. All rights reserved.
//

import UIKit
import WatchConnectivity
//import SystemConfiguration

class ViewController: UIViewController, WCSessionDelegate  {

    @IBOutlet var connectionLAbel: UILabel!
    
    var reachableStatus: String?
    var session: WCSession!
    
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        print("Message recieved, sending connection status")
        connectionLAbel.text = message["CurrentConnection"] as? String
        
        let reachability: Reachability = Reachability.reachabilityForInternetConnection()
        reachableStatus = reachability.currentReachabilityString
        
        replyHandler(["ConnectionStatus": reachableStatus!])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let reachability: Reachability = Reachability.reachabilityForInternetConnection()
//        print(reachability.isReachableViaWiFi())
//        print(reachability.isReachableViaWWAN())
//        print(reachability.isReachable())
//        print(reachability.currentReachabilityStatus)
//        print(reachability.currentReachabilityString)
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self;
            session.activateSession();
        }
//        print("gogggoggo")
//        reachableStatus = reachability.currentReachabilityString
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    
}

