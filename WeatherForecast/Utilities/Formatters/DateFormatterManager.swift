//
//  DateFormatterManager.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import UIKit

class DateFormatterManager {
    
    func getDailyFormat(time: TimeInterval, timeZone: Int) -> String? {
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeStyle = DateFormatter.Style.none //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
}
