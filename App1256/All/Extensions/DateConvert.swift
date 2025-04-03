//
//  DateConvert.swift
//  App1256
//
//  Created by IGOR on 02/04/2025.
//

import SwiftUI

extension Date {

    func convertDate(format: String) -> String {

        let date = self
        let formatter = DateFormatter()

        formatter.dateFormat = format

        return formatter.string(from: date)
    }
}
