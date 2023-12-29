//
//  WeatherListCell+Extension.swift
//  Weather
//
//  Created by Baki Dikbıyık on 26.12.2023.
//

extension WeatherListCellModel {
    
    convenience init(data: WeatherAppResponse) {
        self.init(cityName: data.name,
                  temperature: data.main.temperature,
                  descriptiontext: data.weather.first?.descriptionText,
                  highTemperature: data.main.temperatureMaximum,
                  lowTemperature: data.main.temperatureMinimum)
    }
}
