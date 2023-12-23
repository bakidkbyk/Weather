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
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addSubViews()
        subscribeViewModel()
    }
}

// MARK: - UILayout
extension MainViewController {
    
    private func addSubViews() {
        view.addSubview(mainView)
        mainView.edgesToSuperview(excluding: .bottom, insets: .init(top: 51, left: 0, bottom: 0, right: 0), usingSafeArea: true)
    }
}

// MARK: - ConfigureAndLocalize
extension MainViewController {
    
    private func configureContents() {
        mainView.height(183)
        view.backgroundColor = UIColor.weatherlinearBackground
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func fillData() {
        mainView.cityText = viewModel.cityName
        mainView.temperature = "\((Int((viewModel.temperature ?? 0.0) - viewModel.absoluteZero)))°"
        mainView.descriptionText = viewModel.descriptiontext
        mainView.hightTemperature = "H:\((Int((viewModel.highTemperature ?? 0.0) - viewModel.absoluteZero)))°"
        mainView.lowTemperature = "L:\((Int((viewModel.lowTemperature ?? 0.0) - viewModel.absoluteZero)))°"
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
