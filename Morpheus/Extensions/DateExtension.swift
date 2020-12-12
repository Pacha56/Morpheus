//
//  DateExtension.swift
//  HorseRacing
//
//  Created by Luis Resende on 06/12/2020.
//

import Foundation

extension Date
{
    func formattedDate() -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter.string(from: self)
    }
}
