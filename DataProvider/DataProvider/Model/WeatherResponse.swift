//
//  WeatherResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

public struct WeatherResponse: Decodable {
    
    public let id: Int
    public let main: String?
    public let descriptionText: String?
    public let icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case descriptionText = "description"
        case icon
    }
}
