//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Baki Dikbıyık on 23.12.2023.
//

import Foundation

protocol WeatherListViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(_ indexPath: IndexPath) -> WeatherListCellProtocol
    
}

protocol WeatherListViewEventSource {
    var reloadData: VoidClosure? { get }
}

protocol WeatherListViewProtocol: WeatherListViewDataSource, WeatherListViewEventSource {}

final class WeatherListViewModel: BaseViewModel<WeatherListRouter>, WeatherListViewProtocol {
    
    var reloadData: VoidClosure?
    
    var cellItems: [WeatherListCellProtocol] = []
    
    func numberOfItemsAt() -> Int {
        let cell = cellItems.count
        return cell
    }
    
    func cellItemAt(_ indexPath: IndexPath) -> WeatherListCellProtocol {
        return cellItems[indexPath.row]
    }

}

// MARK: - Network
extension WeatherListViewModel {
    
    func getWeatherList(cityName: String) {
        let request = WeatherListRequest(cityName: cityName)
        self.showActivityIndicatorView?()
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            switch result {
            case .success(let response):
                self.reloadData?()
                
            case .failure(let error):
                self.showSuccessToast?(error.localizedDescription)
            }
        }
    }
}
