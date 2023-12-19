//
//  MainViewModel.swift
//  Weather
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

import Foundation

protocol MainViewDataSource {}

protocol MainViewEventSource {}

protocol MainViewProtocol: MainViewDataSource, MainViewEventSource {}

final class MainViewModel: BaseViewModel<MainRouter>, MainViewProtocol {
    
}
