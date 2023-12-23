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
    
    public init(latitude: Double, longitude: Double) {
        
        self.parameters["lat"] = latitude
        self.parameters["lon"] = longitude
        
        self.parameters["appid"] = Base.apiKey
    }
    
}
