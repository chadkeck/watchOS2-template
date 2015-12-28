//
//  WeatherResponse.swift
//  watchOS2-template
//
//  Created by Chad Bibler on 12/27/15.
//  Copyright © 2015 Chad Bibler. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherResponse: Mappable {
    var location: String?
    var threeDayForecast: [Forecast]?

    required init?(_ map: Map){

    }

    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}

class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?

    required init?(_ map: Map){

    }

    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}