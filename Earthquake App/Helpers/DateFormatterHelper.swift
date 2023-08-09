//
//  DateFormatter.swift
//  Earthquake App
//
//  Created by Ilyas on 5.08.2023.
//

import Foundation


class DateFormatterHelper {

    static func formatDate(_ dateString: String) -> String? {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "d MMMM yyyy, HH:mm"
        outputDateFormatter.locale = Locale(identifier: "tr_TR")
        
        if let date = inputDateFormatter.date(from: dateString) {
            return outputDateFormatter.string(from: date)
        } else {
            return nil
        }
    }

}
