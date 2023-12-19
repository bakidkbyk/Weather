//
//  WeatherResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

public struct WeatherResponse: Decodable {
    
    public let id: Int
    public let main: String?
    public let description: String?
    public let icon: String?
}
