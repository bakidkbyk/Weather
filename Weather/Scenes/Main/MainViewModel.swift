//
//  MainViewModel.swift
//  Weather
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

protocol MainViewDataSource {
    var cityName: String? { get }
    var temperature: Double? { get }
    var descriptiontext: String? { get }
    var highTemperature: Double? { get }
    var lowTemperature: Double? { get }
    var windSpeed: Double? { get }
    var humidity: Int? { get }
    
}

protocol MainViewEventSource {}

protocol MainViewProtocol: MainViewDataSource, MainViewEventSource {}

final class MainViewModel: BaseViewModel<MainRouter>, MainViewProtocol {
    
    var cityName: String?
    var temperature: Double?
    var descriptiontext: String?
    var highTemperature: Double?
    var lowTemperature: Double?
    var windSpeed: Double?
    var humidity: Int?
    
    var isGetDataDidSuccess: VoidClosure?
    
    let absoluteZero = 273.15
}

// MARK: - Network
extension MainViewModel {
    
    func getWeather(latitude: Double, longitude: Double) {
        let request = WeatherRequest(latitude: latitude, longitude: longitude)
        self.showActivityIndicatorView?()
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            switch result {
            case .success(let data):
                self.setData(data: data)
                self.isGetDataDidSuccess?()
            case .failure(let error):
                self.showSuccessToast?(error.localizedDescription)
            }
        }
    }
    
    func setData(data: WeatherAppResponse) {
        cityName = data.name
        temperature = data.main.temperature
        descriptiontext = data.weather.first?.descriptionText
        highTemperature = data.main.temperatureMaximum
        lowTemperature = data.main.temperatureMinimum
        windSpeed = data.wind.speed
        humidity = data.main.humidity
    }
}
