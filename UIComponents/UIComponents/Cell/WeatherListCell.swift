//
//  WeatherListCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 23.12.2023.
//

import UIKit

public class WeatherListCell: UICollectionViewCell, ReusableView {
    
    private let temperatureLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xxLarge))
        .textColor(.weatherPrimary)
        .build()
        
    private let hightAndLowTemperatureStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(10)
        .build()
    
    private let hightTemperatureLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textAlignment(.center)
        .textColor(.weatherPrimary)
        .build()
    
    private let lowTemperatureLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textAlignment(.center)
        .textColor(.weatherPrimary)
        .build()
    
    private let cityLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.weatherPrimary)
        .build()
    
    private let weatherImageView = UIImageViewBuilder()
        .backgroundColor(.clear)
        .build()
    
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.weatherSecondary)
        .build()
    
    weak var viewModel: WeatherListCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    public var temperatureText: Double? {
        willSet {
            temperatureLabel.text = newValue?.toString
        }
    }

    public var hightTemperatureText: Double? {
        willSet {
            hightTemperatureLabel.text = newValue?.toString
        }
    }

    public var lowTemperatureText: Double? {
        willSet {
            lowTemperatureLabel.text = newValue?.toString
        }
    }
    
}

// MARK: - UILayout
extension WeatherListCell {
    
    private func addSubviews() {
        addSubview(temperatureLabel)
        temperatureLabel.edgesToSuperview(excluding: [.bottom, .leading], insets: .init(top: 58, left: 20, bottom: 0, right: 0))
        
        addSubview(hightAndLowTemperatureStackView)
        hightAndLowTemperatureStackView.edgesToSuperview(excluding: [.bottom, .leading], insets: .init(top: 24, left: 20, bottom: 0, right: 0))
        
        hightAndLowTemperatureStackView.addArrangedSubview(hightTemperatureLabel)
        hightAndLowTemperatureStackView.addArrangedSubview(lowTemperatureLabel)
        
        addSubview(cityLabel)
        cityLabel.edgesToSuperview(excluding: [.bottom, .leading], insets: .init(top: 15, left: 20, bottom: 0, right: 0))
        
        addSubview(weatherImageView)
        weatherImageView.edgesToSuperview(excluding: [.bottom, .trailing], insets: .init(top: 12, left: 0, bottom: 0, right: 4))
        
        addSubview(descriptionLabel)
        descriptionLabel.edgesToSuperview(excluding: [.bottom, .trailing], insets: .init(top: 4, left: 0, bottom: 0, right: 24))
    }
}

// MARK: - SetViewModel
extension WeatherListCell {
    
    public func set(viewModel: WeatherListCellProtocol) {
        self.viewModel = viewModel
        self.temperatureText = viewModel.temperature
        self.hightTemperatureText = viewModel.highTemperature
        self.lowTemperatureText = viewModel.lowTemperature
        self.cityLabel.text = viewModel.cityName
        self.descriptionLabel.text = viewModel.descriptiontext
    }
}
