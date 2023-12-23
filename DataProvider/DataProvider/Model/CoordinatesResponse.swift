//
//  CoordinatesResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

public struct CoordinatesResponse: Decodable {
    
    public let longitude: Double?
    public let latitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
