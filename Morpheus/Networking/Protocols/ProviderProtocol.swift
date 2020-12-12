//
//  ProviderProtocol.swift
//  HorseRacing
//
//  Created by Luis Resende on 05/12/2020.
//

protocol ProviderProtocol {
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable
}
