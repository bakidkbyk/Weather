//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Baki Dikbıyık on 23.12.2023.
//

import UIKit

final class WeatherListViewController: BaseViewController<WeatherListViewModel> {
    
    
    private let getCityLabel = FloatLabelTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
    }
}

// MARK: - UILayout
extension WeatherListViewController {
    
    private func addSubviews() {
        view.addSubview(getCityLabel)
        getCityLabel.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 20, bottom: 0, right: 40), usingSafeArea: true)
        
    }
}

// MARK: - ConfigureAndLocalize
extension WeatherListViewController {
    
    private func configureContents() {
        getCityLabel.height(60)
        view.backgroundColor = .white
    }
    
    private func setLocalize() {
        getCityLabel.title = L10n.WeatherList.ciytLabelTitle
    }
}
