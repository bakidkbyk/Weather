//
//  WeatherAppResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

public struct WeatherAppResponse: Decodable {
    public let coordinates: CoordinatesResponse
    public let weather: [WeatherResponse]
    public let main: MainResponse
    public let name: String?
    public let wind: WindResponse
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weather
        case main
        case name
        case wind
    }
}
