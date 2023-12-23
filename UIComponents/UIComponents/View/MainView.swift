//
//  Main.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 21.12.2023.
//

public class MainView: UIView {
    
    private let bodyStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(0)
        .build()
    
    private let cityLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.weatherPrimary)
        .build()
    
    private let temperatureLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xxLarge))
        .textAlignment(.center)
        .textColor(.weatherPrimary)
        .build()
    
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textAlignment(.center)
        .textColor(.weatherSecondary)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    public var cityText: String? {
        willSet {
            cityLabel.text = newValue
        }
    }
    
    public  var descriptionText: String? {
        willSet {
            descriptionLabel.text = newValue
        }
    }
    
    public var temperature: String? {
        willSet {
            temperatureLabel.text = newValue
        }
    }
    
    public var hightTemperature: String? {
        willSet {
            hightTemperatureLabel.text = newValue
        }
    }
    
    public var lowTemperature: String? {
        willSet {
            lowTemperatureLabel.text = newValue
        }
    }
}

// MARK: UILayout
extension MainView {
    
    private func addSubviews() {
//        addSubview(cityLabel)
//        cityLabel.topToSuperview()
//        cityLabel.centerXToSuperview()
//
//        addSubview(temperatureLabel)
//        temperatureLabel.topToBottom(of: cityLabel).constant = 12
//        temperatureLabel.centerXToSuperview()
//
//        addSubview(descriptionLabel)
//        descriptionLabel.topToBottom(of: temperatureLabel).constant = 12
//        descriptionLabel.centerXToSuperview()
//
//        addSubview(hightAndLowTemperatureStackView)
//        hightAndLowTemperatureStackView.topToBottom(of: descriptionLabel).constant = 10
//        hightAndLowTemperatureStackView.centerXToSuperview()
//
//        hightAndLowTemperatureStackView.addArrangedSubview(hightTemperatureLabel)
//        hightAndLowTemperatureStackView.addArrangedSubview(lowTemperatureLabel)
        
        addSubview(bodyStackView)
        bodyStackView.topToSuperview()
        bodyStackView.centerXToSuperview()
        
        bodyStackView.addArrangedSubview(cityLabel)
        bodyStackView.addArrangedSubview(temperatureLabel)
        bodyStackView.addArrangedSubview(descriptionLabel)
        
        addSubview(hightAndLowTemperatureStackView)
        hightAndLowTemperatureStackView.topToBottom(of: bodyStackView).constant = 12
        hightAndLowTemperatureStackView.centerXToSuperview()
        
        hightAndLowTemperatureStackView.addArrangedSubview(hightTemperatureLabel)
        hightAndLowTemperatureStackView.addArrangedSubview(lowTemperatureLabel)
    }
}
