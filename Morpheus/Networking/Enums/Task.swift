//
//  Task.swift
//  HorseRacing
//
//  Created by Luis Resende on 05/12/2020.
//

typealias Parameters = [String: Any]

enum Task {
    case requestPlain
    case requestParameters(Parameters)
}
