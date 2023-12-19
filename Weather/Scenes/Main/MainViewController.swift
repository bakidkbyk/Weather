//
//  MainViewController.swift
//  Weather
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

import UIKit
import CoreLocation

final class MainViewController: BaseViewController<MainViewModel> {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
    
}

// MARK: - UILayout

// MARK: - ConfigureContents
extension MainViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

// MARK: - LocationManager
extension MainViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            if location.horizontalAccuracy > 0 {
                locationManager.stopUpdatingLocation()
                
                let longitude = location.coordinate.longitude
                let latitude = location.coordinate.latitude
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location updated failed, \(error) ")
    }
}
