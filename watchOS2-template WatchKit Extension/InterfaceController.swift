//
//  InterfaceController.swift
//  watchOS2-template WatchKit Extension
//
//  Created by Chad Bibler on 12/27/15.
//  Copyright © 2015 Chad Bibler. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["platform": "watchOS"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization

                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
