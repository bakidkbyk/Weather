//
//  BottomWeatherInfoView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 27.12.2023.
//

public class BottomWeatherInfoView: UIView {
    
    private let iconImageView = UIImageViewBuilder()
        .build()
    
    private let titleLabel = UILabelBuilder()
        .textColor(.weatherDarkBlue)
        .font(.font(.nunitoSemiBold, size: .medium))
        .build()
    
    private let countLabel = UILabelBuilder()
        .textColor(.weatherDarkBlue)
        .font(.font(.nunitoBold, size: .large))
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    public var icon: UIImage? {
        willSet {
            iconImageView.image = newValue
        }
    }
    
    public var titleText: String? {
        willSet {
            titleLabel.text = newValue
        }
    }
    
    public var countText: String? {
        willSet {
            countLabel.text = newValue
        }
    }
}

// MARK: - UILayout
extension BottomWeatherInfoView {
    
    private func addSubviews() {
        addSubview(iconImageView)
        iconImageView.size(.init(width: 20, height: 40))
        iconImageView.edgesToSuperview(excluding: [.bottom, .right], insets: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        addSubview(titleLabel)
        titleLabel.topToSuperview().constant = 10
        titleLabel.leadingToTrailing(of: iconImageView).constant = 10

        addSubview(countLabel)
        countLabel.topToBottom(of: titleLabel)
        countLabel.leadingToTrailing(of: iconImageView).constant = 10
    }
}
