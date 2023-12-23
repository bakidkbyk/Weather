//
//  WeatherListCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 23.12.2023.
//

import Foundation

public protocol WeatherListCellDataSource: AnyObject {
    var cityName: String? { get }
    var temperature: Double? { get }
    var descriptiontext: String? { get }
    var highTemperature: Double? { get }
    var lowTemperature: Double? { get }
    
}

public protocol WeatherListCellEventSource: AnyObject {
    
}

public protocol WeatherListCellProtocol: WeatherListCellDataSource, WeatherListCellEventSource {
    
}

public final class WeatherListCellModel: WeatherListCellProtocol {
    
    public var cityName: String?
    public var temperature: Double?
    public var descriptiontext: String?
    public var highTemperature: Double?
    public var lowTemperature: Double?
    
}
