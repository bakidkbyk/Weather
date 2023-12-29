//
//  HomeViewModel.swift
//  Weather
//
//  Created by Baki Dikbıyık on 28.12.2023.
//

protocol HomeViewDataSource {
    var selectedSegmentIndex: Int { get set }
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    var selectedSegmentIndex = 0
}
