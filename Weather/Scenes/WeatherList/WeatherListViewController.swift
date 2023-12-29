//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Baki Dikbıyık on 23.12.2023.
//

import UIKit

final class WeatherListViewController: BaseViewController<WeatherListViewModel> {
    
    private let collectionView = UICollectionViewBuilder()
        .backgroundColor(.clear)
        .build()
    
    private let getCityLabel = FloatLabelTextField()
    private let sendButton = UIButtonBuilder()
        .cornerRadius(4)
        .backgroundColor(.white)
        .build()
    
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WeatherListCell.self)
        getCityLabel.height(60)
        view.backgroundColor = .white
    }
    
    private func setLocalize() {
        getCityLabel.title = L10n.WeatherList.ciytLabelTitle
    }
}

// MARK: - UICollectionViewDelegate
extension WeatherListViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource
extension WeatherListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WeatherListCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WeatherListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width
        return CGSize(width: cellWidth, height: 185)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    

}
