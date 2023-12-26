//
//  WeatherListRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 26.12.2023.
//

public struct WeatherListRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = WeatherAppResponse
    
    public let path: String = "weather"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]

    public init(cityName: String) {
        self.parameters["q"] = cityName
        self.parameters["appid"] = Base.apiKey
    }
    
}
