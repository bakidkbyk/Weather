//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Baki Dikbıyık on 23.12.2023.
//

import Foundation

protocol WeatherListViewDataSource {}

protocol WeatherListViewEventSource {}

protocol WeatherListViewProtocol: WeatherListViewDataSource, WeatherListViewEventSource {}

final class WeatherListViewModel: BaseViewModel<WeatherListRouter>, WeatherListViewProtocol {
    
}
