//
//  DateExtension.swift
//  EEMI
//
//  Created by Oscar Elizondo on 2/20/19.
//  Copyright © 2019 Io Labs. All rights reserved.
//

import Foundation

extension Date {
    func toString () -> String {
        var date = self.description.split(separator: " ")[0].split(separator: "-")
        return (String(date[1] + date[2] + date[0]))
    }
    
    func interval(of component: Calendar.Component) -> DateInterval {
        let calendar = Calendar.current
        return calendar.dateInterval(of: component, for: self)!
    }
    
    func toString(format: String) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "EN")
        let formatedString = dateFormatter.string(from: date)
        
        return formatedString
    }
}