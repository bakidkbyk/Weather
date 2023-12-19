//
//  MainRoute.swift
//  Weather
//
//  Created by Baki Dikbıyık on 19.12.2023.
//

protocol MainRoute {
    func presentMain()
}

extension MainRoute where Self: RouterProtocol {
    
    func presentMain() {
        let router = MainRouter()
        let viewModel = MainViewModel(router: router)
        let viewController = MainViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
