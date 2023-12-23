//
//  MainResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

public struct MainResponse: Decodable {
    
    public let temperature: Double?
    public let feelsLike: Double?
    public let temperatureMinimum: Double?
    public let temperatureMaximum: Double?
    public let pressure: Double?
    public let humidity: Double?
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case temperatureMinimum = "temp_min"
        case temperatureMaximum = "temp_max"
        case pressure
        case humidity
    }
}
