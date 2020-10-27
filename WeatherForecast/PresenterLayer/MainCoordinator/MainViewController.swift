//
//  MainViewController.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit
import RxSwift

class MainViewController: BaseViewController<MainViewModel> {
    
    private let disposeBag = DisposeBag()
    
    private var headerViewComponent: HeaderViewComponent!
    private var cityListViewComponent: CityListViewComponent!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        view.backgroundColor = .white
        
        addHeaderViewComponent()
        addHeaderViewComponentListeners()
        addCityListViewComponent()
        addCityListViewComponentListener()
        addViewModelListeners()
        
        viewModel.getWeatherGroupForecastData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func addHeaderViewComponent() {
        headerViewComponent = HeaderViewComponent(data: viewModel.factory.returnHeaderViewComponentData())
        headerViewComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerViewComponent)
        
        NSLayoutConstraint.activate([
        
            headerViewComponent.topAnchor.constraint(equalTo: view.topAnchor),
            headerViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        ])
    }
    
    private func addHeaderViewComponentListeners() {
        headerViewComponent.subscribeRightIconListener { [weak self] in
            self?.viewModel.fireCitySearch()
        }
    }
    
    private func addCityListViewComponent() {
        cityListViewComponent = CityListViewComponent()
        cityListViewComponent.translatesAutoresizingMaskIntoConstraints = false
        cityListViewComponent.setDelegate(self)
        
        view.addSubview(cityListViewComponent)
        
        NSLayoutConstraint.activate([
        
            cityListViewComponent.topAnchor.constraint(equalTo: headerViewComponent.bottomAnchor),
            cityListViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityListViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cityListViewComponent.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
        
        ])
    }
    
    func addCityListViewComponentListener() {
        cityListViewComponent.subscribeSelectedCity { [weak self](cityId) in
            self?.viewModel.getDailyForecastData(cityId: cityId)
        }
    }
    
    private func addViewModelListeners() {
        viewModel.subscribeDataLoadingProcess { [weak self](state) in
            switch state {
            case .loading:
                break
            case .loaded:
                self?.cityListViewComponent.reloadComponent()
            default:
                break
            }
        }.disposed(by: disposeBag)
    }
    
}

// Mark: - CityListViewComponentDelegate -
extension MainViewController: CityListViewComponentDelegate {
    func getNumberOfItems(in section: Int) -> Int {
        return viewModel.getNumberOfItems(in: section)
    }
    
    func getNumberOfSections() -> Int {
        return viewModel.getNumberOfSection()
    }
    
    func getCityItem(by index: Int) -> GenericRowDataProtocol? {
        return viewModel.getCityItem(at: index)
    }
    
    
}
