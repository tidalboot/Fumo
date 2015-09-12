//
//  InterfaceController.swift
//  fumo WatchKit Extension
//
//  Created by Nick Jones on 08/09/2015.
//  Copyright © 2015 fumo. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    @IBOutlet var connectionLabel: WKInterfaceLabel!
    var session : WCSession!

    
    
    @IBAction func checkConnectionStatus() {
//        if (session.reachable) {
//            session.sendMessage(["CurrentConnection" : "Connected"], replyHandler: { (reply: [String : AnyObject]) -> Void in
//                    print("It worked!!")
//                    self.connectionLabel.setText(reply["ConnectionStatus"] as? String)
//                }) { (NSError) -> Void in
//                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                        print("Failed")
//                    })
//            }
//            print("Connection is reachable")
//        } else {
//            print("Connection unavailable")
//        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        super.willActivate()
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "checkConnection", userInfo: nil, repeats: true)
    }
    
    func checkConnection () {
        if (session.reachable) {
            session.sendMessage(["CurrentConnection" : "Connected"], replyHandler: { (reply: [String : AnyObject]) -> Void in
                print("It worked!!")
                self.connectionLabel.setText(reply["ConnectionStatus"] as? String)
                }) { (NSError) -> Void in
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        print("Failed")
                    })
            }
            print("Connection is reachable")
        } else {
            print("Connection unavailable")
        }
    }
    

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
