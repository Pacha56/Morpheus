//
//  NetworkResponse.swift
//  HorseRacing
//
//  Created by Luis Resende on 05/12/2020.
//

enum NetworkResponse<T> {
    case success(T)
    case failure(String)
}
