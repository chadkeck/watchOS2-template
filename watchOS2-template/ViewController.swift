//
//  ViewController.swift
//  watchOS2-template
//
//  Created by Chad Bibler on 12/27/15.
//  Copyright © 2015 Chad Bibler. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        Alamofire.request(.GET, URL).responseJSON { response in
            let weatherResponse = Mapper<WeatherResponse>().map(response.result.value)

            if let threeDayForecast = weatherResponse?.threeDayForecast {
                for forecast in threeDayForecast {
                    print(forecast.day)
                    print(forecast.temperature)
                }
            }

        }
    }

}

