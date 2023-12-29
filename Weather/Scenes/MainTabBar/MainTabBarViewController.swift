//
//  MainTabBarViewController.swift
//  Weather
//
//  Created by Baki Dikbıyık on 23.12.2023.
//

//final class MainTabBarViewController: UITabBarController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        tabBar.tintColor = .weatherlinearBackground
//        tabBar.backgroundColor = .weatherSecondary
//        
//        let mainViewController = createMainViewController()
//        let weatherListViewController = createWeatherListController()
//        
//        viewControllers = [
//            mainViewController,
//            weatherListViewController
//        ]
//    }
//    
//    func createMainViewController() -> UINavigationController {
//        let mainRouter = MainRouter()
//        let mainViewModel = MainViewModel(router: mainRouter)
//        let mainViewController = MainViewController(viewModel: mainViewModel)
//        let navigationController = UINavigationController(rootViewController: mainViewController)
//        navigationController.tabBarItem.image = .homeIcon
//        mainRouter.viewController = mainViewController
//        return navigationController
//    }
//    
//    func createWeatherListController() -> UINavigationController {
//        let weatherListRouter = WeatherListRouter()
//        let weatherListViewModel = WeatherListViewModel(router: weatherListRouter)
//        let weatherListViewController = WeatherListViewController(viewModel: weatherListViewModel)
//        let navigationController = UINavigationController(rootViewController: weatherListViewController)
//        navigationController.tabBarItem.image = .icHeart
//        weatherListRouter.viewController = weatherListViewController
//        return navigationController
//    }
//}
