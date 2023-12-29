//
//  HomeViewController.swift
//  Weather
//
//  Created by Baki Dikbıyık on 28.12.2023.
//

import Segmentio

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let segmentControl: Segmentio = {
        let segmentControl = Segmentio()
        
        segmentControl.setup(content: [SegmentioItem(title: L10n.Home.currentWeather,
                                                     image: nil, selectedImage: nil),
                                       SegmentioItem(title: L10n.Home.weatherList,
                                                     image: nil, selectedImage: nil)],
                             style: .onlyLabel, options: .segmentioOptionsChanged())
        
        return segmentControl
    }()
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private lazy var subViewControllers: [UIViewController] = {
        return self.configureControllers()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configure()
        segmentioDidChange()
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubviews() {
        
        view.addSubview(segmentControl)
        segmentControl.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        
        view.addSubview(pageViewController.view)
        addChild(pageViewController)
        
        pageViewController.view.edgesToSuperview(excluding: .top, usingSafeArea: false)
        pageViewController.view.topToBottom(of: segmentControl)
    }
}

// MARK: - Configure
extension HomeViewController {
    
    private func configure() {
        view.backgroundColor = .white
        definesPresentationContext = true
        segmentControl.height(63)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([subViewControllers[viewModel.selectedSegmentIndex]], direction: .forward, animated: true)
        segmentControl.selectedSegmentioIndex = 0
    }
}

// MARK: - ConfigureControllers
extension HomeViewController {
    
    private func configureControllers() -> [UIViewController] {
        let mainRouter = MainRouter()
        let mainViewModel = MainViewModel(router: mainRouter)
        let mainVewController = MainViewController(viewModel: mainViewModel)
        mainRouter.viewController = mainVewController
        
        let weatherListRouter = WeatherListRouter()
        let weatherListViewModel = WeatherListViewModel(router: weatherListRouter)
        let weatherListViewController = WeatherListViewController(viewModel: weatherListViewModel)
        weatherListRouter.viewController = weatherListViewController
        
        return [mainVewController, weatherListViewController]
    }
}

// MARK: - SegmentControlValueDidChange
extension HomeViewController {
    
    private func segmentioDidChange() {
        segmentControl.valueDidChange = { [weak self] _, segmentIndex in
            guard let self = self else { return }
            var direction: UIPageViewController.NavigationDirection = .forward
            if segmentIndex < self.viewModel.selectedSegmentIndex {
                direction = .reverse
            }
            self.pageViewController.setViewControllers([self.subViewControllers[segmentIndex]], direction: direction, animated: true)
            self.viewModel.selectedSegmentIndex = segmentIndex
        }
    }
}

// MARK: - PageViewControllerDelegate
extension HomeViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let index = subViewControllers.firstIndex(of: currentViewController) {
                segmentControl.selectedSegmentioIndex = index
            }
        }
    }
}

// MARK: - PageViewControllerDataSource
extension HomeViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = self.subViewControllers.firstIndex(of: viewController), index > 0 else { return nil }
        let before = index - 1
        return subViewControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.subViewControllers.firstIndex(of: viewController), index < (subViewControllers.count - 1) else { return nil }
        let after = index + 1
        return subViewControllers[after]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
}
