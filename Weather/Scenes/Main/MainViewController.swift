//
//  MainViewController.swift
//  Weather
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

import UIKit
import CoreLocation

final class MainViewController: BaseViewController<MainViewModel> {
    
    let mainView = MainView()
    
    let bottomView = UIViewBuilder()
        .cornerRadius(20)
        .build()
    
    private let weatherTitleLabel = UILabelBuilder()
        .textColor(.weatherDarkBlue)
        .font(.font(.nunitoBold, size: .medium))
        .build()
    
    private let minimumTemperatureView = BottomWeatherInfoView()
    private let maximumTemperatureView = BottomWeatherInfoView()
    private let windSpeedView = BottomWeatherInfoView()
    private let humidityView = BottomWeatherInfoView()

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addSubViews()
        setLocalize()
        subscribeViewModel()
    }
}

// MARK: - UILayout
extension MainViewController {
    
    private func addSubViews() {
        view.addSubview(mainView)
        mainView.edgesToSuperview(excluding: .bottom, insets: .init(top: 51, left: 0, bottom: 0, right: 0), usingSafeArea: true)
        
        view.addSubview(bottomView)
        bottomView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        bottomView.addSubview(weatherTitleLabel)
        weatherTitleLabel.edgesToSuperview(excluding: [.bottom, .right], insets: .init(top: 10, left: 20, bottom: 0, right: 0))
        
        bottomView.addSubview(minimumTemperatureView)
        minimumTemperatureView.topToSuperview().constant = 30
        minimumTemperatureView.leadingToSuperview().constant = 20
        
        bottomView.addSubview(maximumTemperatureView)
        maximumTemperatureView.edgesToSuperview(excluding: [.bottom, .left], insets: .init(top: 30, left: 0, bottom: 0, right: 140))
        
        bottomView.addSubview(windSpeedView)
        windSpeedView.topToBottom(of: minimumTemperatureView).constant = 60
        windSpeedView.leadingToSuperview().constant = 20
        
        bottomView.addSubview(humidityView)
        humidityView.topToBottom(of: maximumTemperatureView).constant = 60
        humidityView.trailingToSuperview().constant = -140 
    }
}

// MARK: - ConfigureAndLocalize
extension MainViewController {
    
    private func configureContents() {
        mainView.height(183)
        view.backgroundColor = UIColor.weatherlinearBackground
        
        bottomView.backgroundColor = .white
        bottomView.height(200)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func setLocalize() {
        weatherTitleLabel.text = L10n.MainViewController.weatherTitleText
    }
    
    private func fillData() {
        mainView.cityText = viewModel.cityName
        mainView.temperature = "\((Int((viewModel.temperature ?? 0.0) - viewModel.absoluteZero)))°"
        mainView.descriptionText = viewModel.descriptiontext
        
        minimumTemperatureView.icon = UIImage(systemName: "thermometer.low")
        minimumTemperatureView.icon?.withTintColor(.black, renderingMode: .alwaysTemplate)
        minimumTemperatureView.titleText = L10n.MainViewController.minTemp
        minimumTemperatureView.countText = "\((Int((viewModel.lowTemperature ?? 0.0) - viewModel.absoluteZero)))°"
        
        maximumTemperatureView.icon = UIImage(systemName: "thermometer.medium")
        maximumTemperatureView.titleText = L10n.MainViewController.maxTemp
        maximumTemperatureView.countText = "\((Int((viewModel.highTemperature ?? 0.0) - viewModel.absoluteZero)))°"
        
        windSpeedView.icon = UIImage(systemName: "wind")
        windSpeedView.titleText = L10n.MainViewController.windSpeed
        windSpeedView.countText = "\((Int((viewModel.windSpeed ?? 0.0))))m/s"
        
        humidityView.icon = UIImage(systemName: "humidity")
        humidityView.titleText = L10n.MainViewController.humidity
        humidityView.countText = "\(((viewModel.humidity ?? 0)))%"
    }
}

// MARK: - SubscribeViewModel
extension MainViewController {
    
    private  func subscribeViewModel() {
        viewModel.isGetDataDidSuccess = { [weak self] in
            guard let self = self else { return }
            self.fillData()
        }
    }
}

// MARK: - LocationManager
extension MainViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
           
                let latitude = location.coordinate.latitude
                let longitude = location.coordinate.longitude
                
                print("longitude: \(longitude)")
                print("latitude: \(latitude)")
                
                viewModel.getWeather(latitude: latitude, longitude: longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location updated failed, \(error) ")
    }
}
