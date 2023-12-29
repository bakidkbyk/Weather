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
    
}

// MARK: UILayout
extension MainView {
    
    private func addSubviews() {
        
        addSubview(bodyStackView)
        bodyStackView.topToSuperview()
        bodyStackView.centerXToSuperview()
        
        bodyStackView.addArrangedSubview(cityLabel)
        bodyStackView.addArrangedSubview(temperatureLabel)
        bodyStackView.addArrangedSubview(descriptionLabel)
    }
}
