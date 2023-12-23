//
//  MainTabBarRoute.swift
//  Weather
//
//  Created by Baki Dikbıyık on 23.12.2023.
//

protocol MainTabBarRoute {
    func placeOnWindowTabBar()
}

extension MainTabBarRoute where Self: RouterProtocol {
    
    func placeOnWindowTabBar() {
        let mainTabBarController = MainTabBarViewController()
        let transition = PlaceOnWindowTransition()
 
        open(mainTabBarController, transition: transition)
    }
}
