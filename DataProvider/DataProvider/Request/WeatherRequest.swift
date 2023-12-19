//
//  WeatherRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

public struct WeatherRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = WeatherAppResponse
    
    public let path: String = "weather"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(longitude: Double, latitude: Double) {
        self.parameters["lon"] = longitude
        self.parameters["lat"] = latitude
        self.parameters["api_key"] = "634d45deea899cf0574486522709d9a4"
    }
    
}
